Get started
==============================================================

```
npx create-remix --template remix-run/indie-stack project-name
```

What is remix
==============================================================

- **Component full stack**: On same component can access to database for fetch data, this code is only called in server side

- **Backend for frontend**: Don't generate API rest, get data from server side.

- **Get only required data from Network for component like graphql**: Data can be filtered in SSR from a loader().

- **Hide sensible data from HTML**: Manage sensible data in server side from a loader().

- **Optimized compiler**: Don't use webpack. Use Vite instead, it's much faster.

- **Can pre-fetch not only components, also fetch data**: Page transitions are instant.

- **Works without enable javascript**: Use SSR and HTML standards like form actions for mutate data.

Remix architecture
==============================================================

The workflow in remix development consist in 3 main folders:

1. **Routes**: Components with paths accessible in url, same as pages in nextjs.
2. **Prisma**: Define database schema and generate seeds.

In case to use remix only as frontend, only would use **1.Routes** and fetch API rest from action and loader of a component.

Component structure
==============================================================

- Use `export async function` to give access to everything a component would need, like fetching, error boundary, headers, etc...

## Fetching data

- Define a loader

```
export async function loader({ request, params }: LoaderArgs) {
  const userId = await requireUserId(request);
  invariant(params.noteId, "noteId not found");

  const post = await getPost({ userId, id: params.slug });
  if (!post) {
    throw new Response("Not Found", { status: 404 });
  }
  return json({ post });
}
```

- Get data from useHook

```
const data = useLoaderData<typeof loader>();
```

## Updating data

- Define an action to listen for POST, PUT, DELETE, etc..

```
export async function action({ request, params }: ActionArgs) {
  const userId = await requireUserId(request);
  invariant(params.noteId, "noteId not found");

  await deleteNote({ userId, id: params.noteId });

  return redirect("/notes");
}
```

- Trigger an action with a form

```
import { Form } from "@remix-run/react";

<Form method="post">
  <button
    type="submit"
    className="rounded bg-blue-500  py-2 px-4 text-white hover:bg-blue-600 focus:bg-blue-400"
  >
    Delete
  </button>
</Form>
```

## Other accessible methods

1. errorBoundary
2. headers
3. meta
4. links

Routing
==============================================================

```
/routes/post/index.tsx      => /post
/routes/post/new.tsx        => /post/new
/routes/post.new.tsx        => /post/new
/routes/__post/product.tsx  => /product        Routing ignores __file & __folder names
/routes/[sitemap.xml].tsx   => /sitemap.xml    Escaping special chars with []
/routes/$.tsx               => /*              All other routes
```

## Providing API REST

Use resource routes, It provides an API rest similar to express (If I were building a REST API, I would prefer this over express.)

https://remix.run/docs/en/1.18.1/guides/resource-routes
