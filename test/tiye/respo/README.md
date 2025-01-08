# Respo in MoonBit(Beta)

> tiny toy virtual DOM library ported from [Respo.rs](https://github.com/Respo/respo.rs).

- Docs https://mooncakes.io/docs/#/tiye/respo/
- Live Demo https://repo.respo-mvc.org/respo.mbt

Core ideas:

- hot reload friendly for better debugging experience
- types as hints for DOM DSL
- states are stored in a single atom, which is a tree structure, has concept like `cursor`
- uni-directional data flow, dispatching is only allowed during user events
- effects are for DOM(not for dispatching actions)

This project is in early stage, APIs and structure may change.

TODO:

- immutable data enhancement

### Usage

```bash
moon add tiye/respo
```

To use Respo, start with the boilerplate at https://github.com/Respo/respo-moonbit-workflow

### License

Apache-2.0
