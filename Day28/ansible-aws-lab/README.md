# Day 28 — Ansible AWS Lab

## Overview

This project demonstrates Ansible configuration management using an AWS EC2 instance as the managed server.

## Architecture

WSL Ubuntu
    |
    | SSH
    v
AWS EC2
    |
    v
Ansible
    |
    +-- Install Nginx
    +-- Manage services
    +-- Manage files
    +-- Manage users
    +-- Manage configuration
    +-- Use handlers
    +-- Use variables
    +-- Use facts
    +-- Use roles

## Topics Practiced

- Ansible installation
- Inventory
- SSH connectivity
- Ansible ping module
- Ad-hoc commands
- Playbooks
- Modules
- Variables
- Facts
- Handlers
- File management
- User management
- Roles
- Idempotency
- Check mode

## Main Commands

### Test connectivity

```bash
ansible -i inventory.ini web -m ping
