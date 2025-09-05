### Templates
My templates can be found on seperate branches for each language. See the branches.

## Usage:
1. Go to `https://github.com/Danhall01/templates` and click the button `Use this template`.
2. Make sure to toggle the `Include all branches` to *ON*.
3. Clone the repository locally onto your machine.
4. When in the `main` branch run the generator script with the desired template branch as an argument. 
Linux
```bash
./generator.sh "<branch>"
```
Windows
```batch
./generator.bat "<branch>"
```
5. Done! The repository should now only include the `main` branch with no local or remote remains of the other template branches.

## Remarks:
* If you want the main branch to be called another name than `main`, then you need to edit the variable containing the `MAIN_BRANCH` in the desired generator script before running it. It is however recommended to change the main branch name after using the generator script.
