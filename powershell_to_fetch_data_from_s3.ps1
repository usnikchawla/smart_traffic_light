Import-Module AWSPowerShell
$BucketName = 'oobj-det0910'
$i = 0
$Params = @{
	BucketName = $BucketName
	Key = 'data.txt'
	File = 'C:\Users\Administrator\Downloads\light_code_108_9_processing_sagemaker\data\data.txt'
}

while($true){
	$i++
	Read-S3Object @Params
	cls
	Write-Host $i iteration of file update
	Start-Sleep -s 5
}

