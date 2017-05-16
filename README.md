kbox-login is a trivially simple mock-login program for KBOX on Android.
Some Linux utilities expect to be able to invoke /bin/login, and Android
does not provide one. This totally-insecure implementation reads and
compares a username and password from a plain text file, and invokes a
shell if the "login" attempt succeeds.

