parser grammar ModDescriptorParser;
options {
    tokenVocab=ModDescriptorLexer;
}
import CommonParser;

modDescriptorFile: descriptorPropertyDeclaration+;
descriptorPropertyDeclaration:
    (stringPropertyDeclaration |
    listPropertyDeclaration) ENDLINE;