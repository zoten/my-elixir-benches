# my-elixir-benches

Small personal playground collection of benchmarks for Elixir, for future reference

**NOTE**

Some of them are not mine, so I've just copied the original link in the bench itself. Should the author want to be named instead in this README, just ping me up or open a PR!
Should the author want to be removed from this repository...well, again, same, with all my excuses!

## Elixir/Erlang versions

I use asdf for my BEAM management, so you'll fine a .tool-versions.recommended file stating my current setup (whenever I'll remember to update it).
Feel free to edit it as your wish, since it will not be versioned.

## Bench

``` bash
elixir name_of_file.exs
```

### Notes

 * please close any RAM-eager process (my list is usually Chrome, Firefox, Teams, Spotify), since results collection or the test itself may be RAM-heavy

## TODO

 - [ ] Make this a mix prooject, so dep install can be done once and for all?