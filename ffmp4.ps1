#$filename = "HelloWorld.txt"
#$extension = [System.IO.Path]::GetExtension($filename)
#$result = $filename.Substring(0, $filename.Length - $extension.Length)
#Write-Host $result

$files = Get-ChildItem -Path . | Where-Object {!$_.PSIsContainer} | Select-Object -ExpandProperty Name

foreach ($file in $files) {
    $extension = [System.IO.Path]::GetExtension($file)
    $output = $file.Substring(0, $file.Length - $extension.Length) + ".mp4"

    ffmpeg -i $file -crf 1 -c:v libx264 $output
}

