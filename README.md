# What is Build-Spy?
Build-Spy is a quick and dirty Powershell script to aid in information gathering when performing on-host build reviews as part of a penetration testing engagement

When on an engagement that has build-reviews in scope a lot of manual checks are normally performed such as does the machine have the on-host firewall enabled, is UAC enabled etc. This can sometimes be a time consuming task. So I decided to create this script which will dump the information into a text file for easy viewing.

# What Information Does it Gather?
The script currently grabs the following information

* General System Information
* BIOS Information
* Bitlocker Disk Encryption Status
* Local Administrator Account List
* Local Firewall Status
* Installed HotFixes
* Audit Policy Configuration
* UAC Status
* Plaintext Passwords which maybe in the Registry
* Installed Software
* Unquoted Service Paths - Coming Soon

# Future Plans

Going forward I'd like to get the script to create a nicely formatted HTML report.
