# run-d.m.c
  ruby script to send sms message to person present in contacts yaml file when a process has finished running. stands for run directed message contr...ok I just wanted it to be called runDMC. This code is still untested and unfinished as of initial commit. This is my first time working with ruby and yaml so there may be errors...

## Requirements:
- [trollop](https://github.com/ManageIQ/trollop)

### Usage:
  - **OSX and Linux:**<br>
    ```shell
    
    runby.rb -n <phone number in yaml file> -c <your_command>
    runby.rb -n <phone number in yaml file> -c <your_command> -f #run a command as root. Careful!
    
    ```
  - **Windows:**
    - run a VM?
    - use a live USB?
    - install an OS that's useful?

####TODO:
  - check that code actually works
  - validate phone number before sending message
  - worth creating a gem?
  - eliminate security concerns
  - would like to implement a mail option
  - pushbullet option could be worth looking into



