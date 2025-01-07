
<div id="mod-info">
    <h1 id="mod-title"> coreutils <span id="mod-version">v0.1.3</span></h1>
    
    <hr/>
    <div id="mod-meta-data">
        <div>
            <p>Author</p>
            <p>five-nuts</p>
        </div>
        <div>
            <p>License</p>
            <p>Apache-2.0</p>
        </div>
    </div>
    <hr/>
    <div id="mod-install-info">
        <h3>Install</h3>
        <p>Run the following command in your project directory: </p>
        <pre><code> moon add five-nuts/coreutils </code></pre>
    <div id="build-error"> 
      <svg t="1727332159497" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5301" width="16" height="16"><path d="M545.718857 130.608762c11.337143 6.265905 20.699429 15.555048 26.989714 26.819048l345.014858 617.667047a68.87619 68.87619 0 0 1-26.989715 93.915429c-10.313143 5.705143-21.942857 8.704-33.718857 8.704H166.985143A69.266286 69.266286 0 0 1 97.52381 808.643048c0-11.751619 2.998857-23.28381 8.752761-33.548191l344.990477-617.642667a69.656381 69.656381 0 0 1 94.451809-26.819047zM512 191.000381L166.985143 808.643048H856.990476L512 191.000381zM546.718476 670.47619v69.071239h-69.461333V670.47619h69.485714z m0-298.374095v252.318476h-69.461333V372.102095h69.485714z" p-id="5302" fill="#707070"></path></svg>
      <div>
        <p id="build-error-title">This module cannot build with MoonBit nightly</p>
      </div>
    </div>
    </div>
</div>



# coreutils in Moonbit

[![Test](https://github.com/five-nuts/coreutils/actions/workflows/test.yaml/badge.svg)](https://github.com/five-nuts/coreutils/actions/workflows/test.yaml)

This repository contains programs equivalent to GNU
[coreutils](https://www.gnu.org/software/coreutils/), written in the
[Moonbit](https://www.moonbitlang.com/).

## Goal

Complete set of coreutils, written as closely as possible to the POSIX spec,
with as many GNU extensions as feasible.

We are looking for solid, working implementations of the commands, not 100%
1-to-1 parity, especially not quirks and unintended side-effects.

## Layout

Each command has it's own separate subdirectory under `src`, in case the
implementor wishes to create multiple `.mbt` files to implement a command, or add
a README.md specifically for that command.

## Contributing

Contributions are welcome!

Please only contribute versions of the original utilities written in Moonbit.
Contributions written in other languages will likely be rejected.

When your contribution is finalized, don't forget to update the completed
count below and mark it as done in this README.md. Thanks!

Commit message should follow [conventional commits](https://www.conventionalcommits.org/)

## Completed (4/109)

|  Done   | Cmd       | Descripton                                       |
| :-----: | --------- | ------------------------------------------------ |
|         | **[**     | Alternate form of `test`                         |
|         | arch      | Print machine hardware name                      |
|         | b2sum     | Print or check BLAKE2 digests                    |
|         | base32    | Transform data into printable data               |
|         | base64    | Transform data into printable data               |
|         | basename  | Strip directory and suffix from a file name      |
|         | basenc    | Transform data into printable data               |
|         | cat       | Concatenate and write files                      |
|         | chcon     | Change SELinux context of file                   |
|         | chgrp     | Change group ownership                           |
|         | chmod     | Change access permissions                        |
|         | chown     | Change file owner and group                      |
|         | chroot    | Run a command with a different root directory    |
|         | cksum     | Print CRC checksum and byte counts               |
|         | comm      | Compare two sorted files line by line            |
|         | coreutils | Multi-call program                               |
|         | cp        | Copy files and directories                       |
|         | csplit    | Split a file into context-determined pieces      |
|         | cut       | Print selected parts of lines                    |
|         | date      | Print or set system date and time                |
|         | dd        | Convert and copy a file                          |
|         | df        | Report file system disk space usage              |
|         | dir       | Briefly list directory contents                  |
|         | dircolors | Color setup for ls                               |
|         | dirname   | Strip last file name component                   |
|         | du        | Estimate file space usage                        |
|         | echo      | Print a line of text                             |
|         | env       | Run a command in a modified environment          |
|         | expand    | Convert tabs to spaces                           |
|         | expr      | Evaluate expressions                             |
|         | factor    | Print prime factors                              |
| &check; | false     | Do nothing, unsuccessfully                       |
|         | fmt       | Reformat paragraph text                          |
|         | fold      | Wrap input lines to fit in specified width       |
|         | groups    | Print group names a user is in                   |
|         | head      | Output the first part of files                   |
|         | hostid    | Print numeric host identifier                    |
|         | hostname  | Print or set system name                         |
|         | id        | Print user identity                              |
|         | install   | Copy files and set attributes                    |
|         | join      | Join lines on a common field                     |
|         | kill      | Send a signal to processes                       |
|         | link      | Make a hard link via the link syscall            |
|         | ln        | Make links between files                         |
|         | logname   | Print current login name                         |
|         | ls        | List directory contents                          |
|         | md5sum    | Print or check MD5 digests                       |
|         | mkdir     | Make directories                                 |
|         | mkfifo    | Make FIFOs (named pipes)                         |
|         | mknod     | Make block or character special files            |
|         | mktemp    | Create temporary file or directory               |
|         | mv        | Move (rename) files                              |
|         | nice      | Run a command with modified niceness             |
|         | nl        | Number lines and write files                     |
|         | nohup     | Run a command immune to hangups                  |
|         | nproc     | Print the number of available processors         |
|         | numfmt    | Reformat numbers                                 |
|         | od        | Write files in octal or other formats            |
|         | paste     | Merge lines of files                             |
|         | pathchk   | Check file name validity and portability         |
|         | pinky     | Lightweight finger                               |
|         | pr        | Paginate or columnate files for printing         |
|         | printenv  | Print all or some environment variables          |
|         | printf    | Format and print data                            |
|         | ptx       | Produce permuted indexes                         |
|         | pwd       | Print working directory                          |
|         | readlink  | Print value of a symlink or canonical file name  |
|         | realpath  | Print the resolved file name                     |
|         | rm        | Remove files or directories                      |
|         | rmdir     | Remove empty directories                         |
|         | runcon    | Run a command in specified SELinux context       |
|         | seq       | Print numeric sequences                          |
|         | sha1sum   | Print or check SHA-1 digests                     |
|         | sha224sum | Print or check SHA-2 224 bit digests             |
|         | sha256sum | Print or check SHA-2 256 bit digests             |
|         | sha384sum | Print or check SHA-2 384 bit digests             |
|         | sha512sum | Print or check SHA-2 512 bit digests             |
|         | shred     | Remove files more securely                       |
|         | shuf      | Shuffling text                                   |
|         | sleep     | Delay for a specified time                       |
|         | sort      | Sort text files                                  |
|         | split     | Split a file into pieces                         |
|         | stat      | Report file or file system status                |
|         | stdbuf    | Run a command with modified I/O stream buffering |
|         | stty      | Print or change terminal characteristics         |
|         | sum       | Print checksum and block counts                  |
|         | sync      | Synchronize cached writes to persistent storage  |
|         | tac       | Concatenate and write files in reverse           |
| &check; | tail      | Output the last part of files                    |
|         | tee       | Redirect output to multiple files or processes   |
|         | test      | Check file types and compare values              |
|         | timeout   | Run a command with a time limit                  |
|         | touch     | Change file timestamps                           |
|         | tr        | Translate, squeeze, and/or delete characters     |
| &check; | true      | Do nothing, successfully                         |
|         | truncate  | Shrink or extend the size of a file              |
|         | tsort     | Topological sort                                 |
|         | tty       | Print file name of terminal on standard input    |
|         | uname     | Print system information                         |
|         | unexpand  | Convert spaces to tabs                           |
|         | uniq      | Uniquify files                                   |
|         | unlink    | Remove files via the unlink syscall              |
|         | uptime    | Print system uptime and load                     |
|         | users     | Print login names of users currently logged in   |
|         | vdir      | Verbosely list directory contents                |
|         | wc        | Print newline, word, and byte counts             |
|         | who       | Print who is currently logged in                 |
|         | whoami    | Print effective user ID                          |
| &check; | yes       | Print a string until interrupted                 |
