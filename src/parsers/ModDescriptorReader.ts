import {ModDescriptorParser as GeneratedModDescriptorParser} from "./generated/ModDescriptorParser";
import {ModDescriptorLexer as GeneratedModDescriptorLexer} from "./generated/ModDescriptorLexer";
import * as joi from "joi";
import * as antlr4 from "antlr4";
import * as FileReader from "./FileReader";
import {ReadResult} from "./FileReader";
import * as util from "util";
import {Recognizer} from "antlr4/Recognizer";
import {Token} from "antlr4/Token";
import ModDescriptor from "../models/ModDescriptor";
import * as _ from "lodash";
import {LexerNoViableAltException, NoViableAltException} from "antlr4/error";

export default class ModDescriptorReader implements FileReader<ModDescriptor>{
    private errors: any[] = [];
    read(input: string): ReadResult<ModDescriptor> {
        const inputStream = new antlr4.InputStream(input);
        const lexer = new GeneratedModDescriptorLexer(inputStream);
        const tokens = new antlr4.CommonTokenStream(lexer);
        const parser = new GeneratedModDescriptorParser(tokens);
        this.errors = [];
        lexer.removeErrorListeners();
        const errorListener = {
            syntaxError: (recognizer: Recognizer, offendingSymbol: Token, line: number, column: number, msg: string, e: any) => {
                const errorExplanation = determineExplanationForError(e);
                this.errors.push({
                    message: util.format("syntax error on line %s column %s. %s", line, column, msg),
                    line
                });
            },
            reportAmbiguity: (recognizer: Recognizer, dfa: any, startIndex: number, stopIndex: number, exact: any, ambigAlts: any, configs: any) => {
                //console.log("report ambiguity");
            },
            reportAttemptingFullContext: (recognizer: Recognizer, dfa: any, startIndex: number, stopIndex: number, conflictingAlts: any, configs: any) => {
                //console.log("Attempting full context");
            },
            reportContextSensitivity: (recognizer: Recognizer, dfa: any, startIndex: number, stopIndex: number, conflictingAlts: any, configs: any) => {
                //console.log("context sensitivity");
            }
        }
        lexer.addErrorListener(errorListener);
        parser.removeErrorListeners();
        parser.addErrorListener(errorListener);
        parser.buildParseTrees = true;
        const start = parser.modDescriptorFile();
        const parsed = start.accept(this);
        const validated = validate(parsed);
        try {
            if(this.errors.length || validated.error) {
                return {
                    errors: this.errors.length ?  this.errors.length : [{
                        message: validated.error.message
                    }]
                }
            } else {
                return {
                    result: start.accept(this)
                };
            }
        } catch (e) {
            return {
                errors: [...this.errors, e]
            };
        }
    }

    visitChildren(ctx: any) {
        if (!ctx) {
            return;
        }
        const ruleName = ctx.parser.ruleNames[ctx.ruleIndex];
        if (this["RULE_" + ruleName]) {
            return this["RULE_" + ruleName](ctx);
        } else {
            let topCtx = ctx;
            while (topCtx.parentCtx) {
                topCtx = topCtx.parentCtx;
            }
            topCtx.errors = topCtx.errors || [];
            topCtx.errors.push({
                line: ctx.start.line,
                message: util.format("Failed to handle the text %s", ctx.getText())
            })
        }
    }

    RULE_modDescriptorFile(ctx: any) {
        const descriptorModel = {
            errors: [],
            value: {}
        };
        ctx.children.reduce((descriptors, child) => {
            const {propertyName, propertyValue, propertyType} = this.visitChildren(child);
            switch (propertyType) {
                case "array":
                    if (descriptors[propertyName] === undefined) {
                        descriptors[propertyName] = [];
                    }
                    if(_.isArray(propertyValue)) {
                        descriptors[propertyName] = descriptors[propertyName].concat(propertyValue);
                    } else {
                        descriptors[propertyName].push(propertyValue);
                    }
                    break;
                default:
                    descriptors[propertyName] = propertyValue;
                    break;
            }

            return descriptors;
        }, descriptorModel.value)
        return descriptorModel;
    }

    RULE_descriptorPropertyDeclaration(ctx: any) {
        if(ctx.children && ctx.children.length) {
            const ruleDefinition = ctx.children[0].accept(this) || {};
            switch (ruleDefinition.name) {
                case "replace_path":
                    return {...ruleDefinition, ...{type: "array"}};
                default:
                    return ruleDefinition;
            }
        } else {
            return {}
        }
    }

    RULE_stringPropertyDeclaration(ctx: any) {
        const propertyName = this.visitChildren(ctx.children[0]);
        const propertyValue = this.visitChildren(ctx.children[2]);
        return {
            propertyName,
            propertyValue,
            propertyType: "string"
        }
    }

    RULE_identifier(ctx: any) {
        if (ctx.children.length === 1) {
            return ctx.children[0].getText();
        }
    }

    RULE_listPropertyDeclaration(ctx: any) {
        return ctx.children[0].accept(this);
    }

    RULE_singletonListDeclaration(ctx: any) {
        const propertyName = ctx.children[0].accept(this);
        const propertyValue = ctx.children[1].accept(this);
        return {
            propertyName,
            propertyValue,
            type: "array"
        };
    }

    RULE_listBlockDeclaration(ctx: any) {
        const propertyName = ctx.children[0].accept(this);
        const propertyValue = ctx.children.slice(1).reduce((values, child) => values.concat(child.accept(this)), []);
        return {
            propertyName,
            propertyValue,
            propertyType: "array"
        };
    }

    RULE_listBodyDeclaration(ctx: any) {
        const propertyValue = ctx.children.filter(child => child.ruleIndex === GeneratedModDescriptorParser.RULE_listValue)
            .map(child => child.accept(this));
        return propertyValue;
    }

    RULE_stringPropertyValue(ctx: any) {
        if(ctx.children.length === 1) {
            return ctx.children[0].getText();
        }
    }

    RULE_listValue(ctx: any) {
        return this.passThrough(ctx);
    }

    visitErrorNode(ctx: any) {

    }

    visitTerminal(ctx: any) {
        return ctx.getText();
    }
    passThrough(ctx: any) {
        return ctx.children[0].accept(this);
    }
    RULE_string(ctx: any) {
        return ctx.getText();
    }
}

function determineExplanationForError(e) {
    if(e instanceof  LexerNoViableAltException) {
        return "";
    } else if (e instanceof  NoViableAltException) {
        return e.startToken;
    }
}

const ModDescriptorSchema = joi.object({
    name: joi.string().required().messages({
        "any.required": `Missing name declaration. Add a line like name="A name here" in your descriptor file`
    }),
    path: joi.string(),
    tags: joi.array().items(joi.string()),
    picture: joi.string(),
    userDir: joi.string(),
    replacePath: joi.array().items(joi.string()),
    dependencies: joi.array().items(joi.string())
});

function validate(input: any) {
    const validationResult = ModDescriptorSchema.validate(input.value);
    return validationResult;
}