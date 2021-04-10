/**
 * Convert Map to array of objects
 *
 * The structure of the map is
 * [[],[]]
 */
const data = [
  ["devpato", { name: "Pato", age: 100 }],
  ["LeonidasEsteban", { name: "Leonidas", age: 150 }]
];

const contacts = new Map(data);

const array = [...contacts].map(([twitter, info]) => ({ twitter, info }));

console.log(array);

/** PRINTS
 [
  {
    info: {
    age: 100,
    name: "Pato"
    },
    twitter: "devpato"
  },
  {
    info: {
    age: 150,
    name: "Leonidas"
    },
    twitter: "LeonidasEsteban"
  }
]
 */

