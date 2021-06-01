foreach($i in Get-ChildItem -Recurse) {
    if ($i.PSIsContainer) {
        continue
    }

    $dest = $i.Fullname.Replace($PWD, "utf8-processed")
    if (!(Test-Path $(Split-Path $dest -Parent))) {
        New-Item $(Split-Path $dest -Parent) -type Directory
    }

    get-content $i | out-file -encoding utf8 -filepath $dest
}