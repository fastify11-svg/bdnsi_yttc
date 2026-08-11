$path = [Environment]::GetEnvironmentVariable('Path', 'User')
if ($path -notmatch '(?i)c:\\xampp\\php') {
    $newPath = $path + ';c:\xampp\php'
    [Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
    Write-Host 'PHP added to PATH'
} else {
    Write-Host 'PHP already in PATH'
}
