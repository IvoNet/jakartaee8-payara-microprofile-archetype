import groovy.io.FileType

dir = new File(new File(request.outputDirectory), request.artifactId)
dir.eachFileRecurse FileType.FILES,  { file ->
    if (file.name.endsWith(".sh")) {
        file.setExecutable(true, false)
        String filename = file.absolutePath
        filename = filename[0..<filename.lastIndexOf('.')]
        file.renameTo(filename)
    }
}
