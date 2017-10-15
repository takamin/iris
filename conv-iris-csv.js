#!/usr/bin/env node
var inputFile = "iris.data";
var outputFile = "iris.csv";
var fs = require("fs");
fs.readFile(inputFile, "utf-8", function(err, data) {
    var indexOfName = {};
    fs.writeFile(outputFile, data.split(/\r*\n/).map(function(row, indexRow) {
        if(row == "") {
            return "";
        }
        return row.split(",").map(function(column, indexCol) {
            if(indexCol < 4) {
                return column;
            }
            if(!(column in indexOfName)) {
                indexOfName[column] = Object.keys(indexOfName).length;
            }
            return indexOfName[column];
        }).join(",");
    }).join("\n"),
    function(err) {
        var nameIndex = new Array(Object.keys(indexOfName).length);
        Object.keys(indexOfName).forEach(function(key) {
            nameIndex[indexOfName[key]] = "" + indexOfName[key] + ": " + key;
        });
        console.log("The class values in column 5:");
        console.log(nameIndex.join("\n"));
    });
});
