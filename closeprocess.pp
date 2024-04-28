# $ProcessName = "chrome"
# try { (Get-Process -ErrorAction Ignore $ProcessName).CloseMainWindow() } catch { } 

puppet apply scheduled_task { 'Run Notepad':
  command  => 'notepad.exe',
  provider => 'taskscheduler_api2',  # Specify the legacy provider
}

puppet apply scheduled_task { 'Puppet PowerShell script execution': #Unique name for the scheduled task
  command   => "C:\\Windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
  arguments => '-File "C:\\SQL Server\\PowerShell scripts\Puppet.ps1"',
  enabled   => 'true',
  provider  => 'taskscheduler_api2',
  trigger   => [{
      schedule   => 'daily',     # Defines the trigger type.             [required]
      start_time => '02:31',     # Defines the time the task should run. [required]
      start_date => '2023-03-19' # Defaults to the current date.         [not required]
  }],
}
