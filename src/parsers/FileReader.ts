export default interface FileReader<T> {
    read(input:string): ReadResult<T>;
}

export type ReadResult<T> = {
    result?:T;
    errors?:any[];
}