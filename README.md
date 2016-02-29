lib\_mysqludf\_sys
==================

This library `lib_mysqludf_sys` contains a number of functions that allows one to interact with the operating system.

1.  [`sys_eval`](#sys_eval) - executes an arbitrary command, and returns it's output.
2.  [`sys_exec`](#sys_exec) - executes an arbitrary command, and returns it's exit code.
3.  [`sys_get`](#sys_get) - gets the value of an environment variable.
4.  [`sys_set`](#sys_set) - create an environment variable, or update the value of an existing environment variable.

Use [`lib_mysqludf_sys_info()`](#lib_mysqludf_sys_info) to obtain information about the currently installed version of `lib_mysqludf_sys`.

sys\_eval
---------

`sys_eval` takes one command string argument and executes it, returning its output.

### Syntax

    sys_eval(arg1)

### Parameters and Return Values

`arg1`  
A command string valid for the current operating system or execution environment.

returns  
Whatever output the command pushed to the standard output stream.

### Installation

Place the shared library binary in an appropriate location. Log in to mysql as root or as another user with sufficient privileges, and select any database. Then, create the function using the following DDL statement:

    CREATE FUNCTION sys_eval RETURNS STRING SONAME 'lib_mysqludf_sys.so';   


The function will be globally available in all databases.

The deinstall the function, run the following statement:

    DROP FUNCTION sys_eval;


### Examples

None yet

### A Note of Caution

Be very careful in deciding whether you need this function. UDFs are available to all database users - you cannot grant EXECUTE privileges for them. As the commandstring passed to `sys_exec` can do pretty much everything, exposing the function poses a very real security hazard.

Even for a benign user, it is possible to accidentally do a lot of damage with it. The call will be executed with the privileges of the os user that runs MySQL, so it is entirely feasible to delete MySQL's data directory, or worse.

The function is intended for specialized MySQL applications where one needs extended control over the operating system. Currently, we do not have UDF's for ftp, email and http, and this function can be used to implement such functionality in case it is really necessary (datawarehouse staging areas could be a case in example).

You have been warned! If you don't see the hazard, please don't try to find it; just trust me on this.

If you do decide to use this library in a production environment, make sure that only specific commands can be run and file access is limited by using [AppArmor](http://www.novell.com/documentation/apparmor/index.html).

[]()

sys\_exec
---------

`sys_exec` takes one command string argument and executes it.

### Syntax

    sys_exec(arg1)

### Parameters and Return Values

`arg1`  
A command string valid for the current operating system or execution environment.

returns  
An (integer) exit code returned by the executed process.

### Installation

Place the shared library binary in an appropriate location. Log in to mysql as root or as another user with sufficient privileges, and select any database. Then, create the function using the following DDL statement:

    CREATE FUNCTION sys_exec RETURNS INT SONAME 'lib_mysqludf_sys.so';  


The function will be globally available in all databases.

The deinstall the function, run the following statement:

    DROP FUNCTION sys_exec;


### Examples

None yet

### A Note of Caution

Be very careful in deciding whether you need this function. UDFs are available to all database users - you cannot grant EXECUTE privileges for them. As the commandstring passed to `sys_exec` can do pretty much everything, exposing the function poses a very real security hazard.

Even for a benign user, it is possible to accidentally do a lot of damage with it. The call will be executed with the privileges of the os user that runs MySQL, so it is entirely feasible to delete MySQL's data directory, or worse.

The function is intended for specialized MySQL applications where one needs extended control over the operating system. Currently, we do not have UDF's for ftp, email and http, and this function can be used to implement such functionality in case it is really necessary (datawarehouse staging areas could be a case in example).

You have been warned! If you don't see the hazard, please don't try to find it; just trust me on this.

If you do decide to use this library in a production environment, make sure that only specific commands can be run and file access is limited by using [AppArmor](http://www.novell.com/documentation/apparmor/index.html).

[]()

sys\_get
--------

`sys_get` takes the name of an environment variable and returns the value of the variable.

### Syntax

    sys_get([arg1)

### Parameters and Return Values

`arg1`  
A string that denotes the name of an environment value.

returns  
If the variable exists, a string containing the value of the environment variable. If the variable does not exist, the function return NULL.

### Installation

Place the shared library binary in an appropriate location. Log in to mysql as root or as another user with sufficient privileges, and select any database. Then, create the function using the following DDL statement:

    CREATE FUNCTION sys_get RETURNS STRING SONAME 'lib_mysqludf_sys.so';    


The function will be globally available in all databases.

The deinstall the function, run the following statement:

    DROP FUNCTION sys_get;


### Examples

None yet

### A Note of Caution

Be very careful in deciding whether you need this function. UDFs are available to all database users - you cannot grant EXECUTE privileges for them. The variables known in the environment where mysql runs are freely accessible using this function. Any user can get access to potentially secret information, such as the user that is running mysqld, the path of the user's home directory etc.

The function is intended for specialized MySQL applications where one needs extended control over the operating system.

You have been warned! If you don't see the hazard, please don't try to find it; just trust me on this.

[]()

sys\_set
--------

`sys_get` takes the name of an environment variable and returns the value of the variable.

### Syntax

    sys_set([arg1, arg2)

### Parameters and Return Values

`arg1`  
A string that denotes the name of an environment value.

`arg2`  
An expression that contains the value that is to be assigned to the environment variable.

returns  
0 if the assignment or creation succeed. non-zero otherwise.

### Installation

Place the shared library binary in an appropriate location. Log in to mysql as root or as another user with sufficient privileges, and select any database. Then, create the function using the following DDL statement:

    CREATE FUNCTION sys_set RETURNS STRING SONAME 'lib_mysqludf_sys.so';    


The function will be globally available in all databases.

The deinstall the function, run the following statement:

    DROP FUNCTION sys_set;


### Examples

None yet

### A Note of Caution

Be very careful in deciding whether you need this function. UDFs are available to all database users - you cannot grant EXECUTE privileges for them. This function will overwrite existing environment variables.

The function is intended for specialized MySQL applications where one needs extended control over the operating system.

You have been warned! If you don't see the hazard, please don't try to find it; just trust me on this.

## LICENSE

    Copyright (C) 2007  Roland Bouman
    Copyright (C) 2008-2009  Roland Bouman and Bernardo Damele A. G.
    web: http://www.mysqludf.org/
    email: mysqludfs@gmail.com, bernardo.damele@gmail.com

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
