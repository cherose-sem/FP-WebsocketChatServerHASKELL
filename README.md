# Haskel backend with Elm frontend using WebSockets

To import packages (if necessary):

```
> elm package install
> stack install --dependencies-only
> stack update (if missing some modules, should be done before stack install ...)
```

The backend:
```
> stack runhaskell ./src/Main.hs
```

In another window, the frontend:

```
> elm-reactor
```

This has been made together with Daniel G. and Kristin :)
