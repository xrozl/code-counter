import "dart:io";

void main() async {
    var mainDir = new Directory(".");
    var files = await mainDir.list(recursive: true).toList();
    stdout.write("拡張子?: ");
    String? input = await stdin.readLineSync();
    // filter file 
    if (input != null) {
        files = files.where((f) => f.path.endsWith(input)).toList();
    }
    for (var file in files) {
        print(file.path);
    }
    print("${files.length} files found.");
    var lines = 0;
    for (var file in files) {
        var contents = await new File(file.path).readAsString();
        lines += contents.split("\n").length;
    }
    print("$lines lines found.");

}

