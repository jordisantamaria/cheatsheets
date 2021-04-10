# Datetime

To get now()

```
import { DateTime } from "luxon";
var now = DateTime.local();
```

With some date:
```
var dt = DateTime.local(2017, 5, 15, 8, 30);
```

From object:

```
dt = DateTime.fromObject({day: 22, hour: 12, zone: 'America/Los_Angeles', numberingSystem: 'beng'})

```

# Immutability

Los metodos no modifican el objecto, sino que devuelven un nuevo objeto.

```
const dt = DateTime.local();
const dt2 = dt.plus({hours: 3, minutes: 2});
// dt = 2020-11-20T14:11:05.817+09:00
// dt2 = 2020-11-20T17:13:05.817+09:00
```
