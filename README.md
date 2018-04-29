# ft_database

### Prerequisites

For mysql :

- [brouznouf/fivem-mysql-async](https://github.com/brouznouf/fivem-mysql-async/releases)
or
- [GHMatti/FiveM-MySQL](https://github.com/GHMatti/FiveM-MySQL/releases)
and "FiveM Resource (Lua): GHMattiMySQL"

### Installing

Put the folder where you want it and add it to the server.cfg file :

Example:

```
start ft_database
```

or put in to dependencies in __resource.lua :

```
dependency 'ft_database'

or

dependencies {
  ...
  'ft_database',
  ...
}

```

### Documentation

[Online](https://fivemtools-database.readme.io/)

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](LICENSE.md) file for details
