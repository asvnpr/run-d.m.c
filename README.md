# run-d.m.c
  ruby script to send sms message to person present in contacts yaml file when a process has finished running. stands for run directed message contr...ok I just wanted it to be called runDMC. this code is still untested and unfinished as of initial commit. This is my first time working with ruby and yaml so there may be error

## Requirements:
- [trollop](https://github.com/ManageIQ/trollop)

### Usage:
  - **OSX and Linux:**
  ```bash
  runby.rb -n <phone number in yaml file> -c <your_command>
  runby.rb -n <phone number in yaml file> -c <your_command> -f #to run a command as root. Careful!
  ```
  - **Windows:**
    - run a VM?
    - use a live USB?
    - install an OS that's useful?



