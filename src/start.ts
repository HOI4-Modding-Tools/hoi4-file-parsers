import * as yargs from "yargs";
import * as process from "process";
import * as fs from "fs";
import * as path from "path";
import * as util from "util";
import * as os from "os";
import * as chokidar from "chokidar";

import ModDescriptorReader from "./parsers/ModDescriptorReader";

const args = yargs.argv;

console.log("Starting up parser.");
let directory:string = args.directory as string;
if(!directory) {
    console.log("No directory was specified, so watch the current working directory");
    directory = process.cwd();
}
const platformSpecificPathReader = process.platform === "win32" ? path.win32 : path.posix;
readDescriptorFile(platformSpecificPathReader.join(directory, "descriptor.mod"));
chokidar.watch(platformSpecificPathReader.join(directory, "descriptor.mod")).on('change', path => {
    console.log(path + " changed, reading again.");
    readDescriptorFile(path);
})
// search for mod descriptor file in target directory.
function readDescriptorFile(atPath: string) {
    util.promisify(fs.readFile)(atPath, "utf8").then(fileContents => {
        const {errors, content} = new ModDescriptorReader().read(fileContents);
        if(errors?.length) {
            console.error("Errors in " + atPath);
            const sortedErrors = errors.sort((a, b) => a.line - b.line);
            for(const error of sortedErrors) {
                if(error.stack) {
                    console.error(error);
                } else {
                    console.error(error.message);
                }
            }
        } else {
            console.log("Successfully read " + atPath);
        }
    }, error => {
        console.error("System error while trying to read file", error);
    });
}
