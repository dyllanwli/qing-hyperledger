const fs = require('fs');
var args = process.argv.slice(2);
// slice two parameter: node config.js
// args[0] file path
// args[1] source parameter
// args[2] destinate parameter

if(args[0].includes("/")){
    // if args[0] is a path, which included a '/' to point to a file
    filepath = args[0]
} else {
    // else args[0] will be a file, using default path
    filepath = "/root/blockchain-explorer/" + args[0]
}

let config = fs.readFileSync(filepath);
let config_data = JSON.parse(config)
console.log("changing "+ args[0] +" "+ args[1] + " to " + args[2])
args_list = args[1].split(".")
if (args_list.length > 1) {
    if (args_list.length > 2){
        config_data[args_list[0]][args_list[1]][args_list[2]] = args[2]
    } else {
        config_data[args_list[0]][args_list[1]] = args[2]
    }
} else {
    if(config_data[args[1]] == undefined | config_data[args[1]] == "" | config_data[args[1]] == []){
        console.log("config parameter is undefined or length less than 1. creating one...")
    }
    config_data[args[1]] = args[2]
}



let result = JSON.stringify(config_data)
fs.writeFileSync(filepath, result);