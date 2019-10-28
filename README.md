# SharpShot
Trivial .NET desktop capturing for Red Team operations

Uses only legit stuff (in order to bypass Endpoint Protection).

Components:

* minimal .NET screen capture binary,
* script to deploy, run, fetch the screenshot and cleanup.

Target user must have an active session on the target host
(`query user` may be used).

## capture binary

The `SharpShot.sln` is a super minimal .NET screen capturing
project in C#.

Takes the destination .png file (with full pathname) as a mandatory argument.

Build tested using Visual Studio 2019 (Community Edition),
targets .NET Framework version 4.5.

Post-build hook converts the console exe to GUI type in order to
run silently (without popping up a console window).

## deploy script

The script `screenshot.sh` is just an example how I used
it in an engagement. Should be customized before use.

Depends on impacket (wmiexec) and samba (smbclient).

Uses the legit Windows Task Scheduler to run the capture binary
as the target user. Probably little bit noisy, but bypasses AVs.
