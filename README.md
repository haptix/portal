# Appleseed Portal 1.1.0.x

[![Build status](https://ci.appveyor.com/api/projects/status/l34d30kqfnirw4ol?svg=true)](https://ci.appveyor.com/project/AnantCorporation/portal)

Appleseed Portal is an open source Portal and Content Management System focused on 
providing a high-performance, easy-to-use framework. The software gives designers, 
developers, and modern entrepreneurs a singular system to build powerful applications 
and intranets that run the modern enterprise on the Microsoft.NET and Windows platforms.

## Requirements 

Windows 7 / 8 / 10 physical or cloud
SQL Server (Express) 2005/2008/2012/2014
Visual Studio 2015 (Visual Studio 14) for development
.NET 4.6.1

## Quick Install
 * Release
   * Grab the latest release: https://github.com/Appleseed/portal/releases   
 * Database
   * Create an Empty SQL Server Database in a SQL Server Instance
     * Give a user access to your SQL Server Databse [Network Service is recommended]
     * Give this user db_owner in the user mapping section to your database
 * IIS Hosting 
   * Unzip the archive to a non-windows controled folder such as C:\Appleseed\ [ie: Not the Windows folder or locked folders]
   * Create a Site in IIS with a .NET 4.0 Application Pool
     * Change the Identy on the Application Pool to Network Service [The site will run under this identity]
     * Point the IIS site folder to C:\Appleseed\  or where you unzipped your archive
     * Browse your site which will cause a redirect to the Web Installer
 * Web Installer 
   * Follow the Instructions of the Web Installer
     * Give write access to the Identity [ie: NetworkService] of your Application Pool to the below Files and Directories
        * The Web Installer will do an environment check to ensure the proper permissions 
     * Web.config -- Needs write if you want the web installer to set your web.config up for you [recommended]
        * This should be removed after install
     * \rb_logs -- Needs write to provide error / info logs
     * \Portals -- Needs write to allow writing site files 
 * Post-installation
   * On successful installation you should see a bootstrap theme and a login
     


## Website 

http://www.appleseedapp.net

## GitHub 

https://github.com/Appleseed

## Documentation 

http://learn.appleseedapp.net

## Issue Tracker  

https://github.com/Appleseed/portal/issues

