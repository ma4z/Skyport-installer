# Skyport Panel Installer
# Works on

### Supported panel operating systems

| Operating System | Version | Supported          |
| ---------------- | ------- | ------------------ |
| Ubuntu           | 14.04   | :red_circle:       |
|                  | 16.04   | :red_circle: \*    |
|                  | 18.04   | :red_circle: \*    |
|                  | 20.04   | :red_circle: \*    |
|                  | 22.04   | :white_check_mark: |
|                  | 24.04   | :white_check_mark: |
| Debian           | 8       | :red_circle: \*    |
|                  | 9       | :red_circle: \*    |
|                  | 10      | :red_circle: \*    |
|                  | 11      | :white_check_mark: |
|                  | 12      | :white_check_mark: |
| CentOS           | 6       | :red_circle:       |
|                  | 7       | :white_check_mark: |
|                  | 8       | :white_check_mark: |
| macOS            | 10.15+  | :white_check_mark: |
|                  |         |                    |
| Windows          | 7+      | :white_check_mark: |
|                  |         |                    |



## Requirements

- NodeJS
- Git
- npm

## Then Run the Following Command 

```bash
git clone https://github.com/skyportlabs/panel.git && cd panel && npm install && npm run seed && npm run createUser && node .
```
## If wont work try this

```sh
bash <(curl -s https://raw.githubusercontent.com/mtq4/Skyport-installer/main/install.sh)

# Skyport Daemon Installer
# Works on

### Supported Daemon operating systems

| Operating System | Version | Supported          |
| ---------------- | ------- | ------------------ |
| Ubuntu           | 14.04   | :red_circle:       |
|                  | 16.04   | :red_circle: \*    |
|                  | 18.04   | :red_circle: \*    |
|                  | 20.04   | :red_circle: \*    |
|                  | 22.04   | :white_check_mark: |
|                  | 24.04   | :white_check_mark: |
| Debian           | 8       | :red_circle: \*    |
|                  | 9       | :red_circle: \*    |
|                  | 10      | :red_circle: \*    |
|                  | 11      | :white_check_mark: |
|                  | 12      | :white_check_mark: |
| CentOS           | 6       | :red_circle:       |
|                  | 7       | :white_check_mark: |
|                  | 8       | :white_check_mark: |
| macOS            | 10.15+  | :white_check_mark: |
| Windows          | 7+      | :white_check_mark: |
|                  |         |                    |



## Requirements

- NodeJS
- npm
- Git
- Docker

## Then Run the Following Command 

```bash
git clone https://github.com/skyportlabs/skyportd.git && cd skyportd && npm install 
```

## Then you need to Create The Node with Node IP and port as 3000 then click configure and run the following command

```bash
node .
```
