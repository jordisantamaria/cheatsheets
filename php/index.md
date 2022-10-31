# To fix permissions in storage/laravel.log

```
sudo setfacl -Rm u:www-data:rwX,u:jordi:rwX storage/
```

# Artisan

```
php artisan make:model Models/ModelName         # create models
php artisan make:controller ControllerName      # create controllers
php artisan make:request StorePostRequest
php artisan make:provider ViewServiceProvider
php artisan make:seeder ProfessionSeeder

php artisan db:seed --class=UserSeeder
```

# Eloquent

- Finding data

```
Model::all()                                                         # Return all rows from db
Model::where('field', value)->orderBy('name')->take(10)->get();
$model->fresh()                                                      # To refresh data of db
$model->refresh()                                                    # To refresh with relationships
Model::find(1)                                                       # Find by Id
Model::where('active', 1)->first()                                   # Return first ocurrence
Model::firstWhere('active', 1)                                       # Return first ocurrence
Model::findOrFail(1)                                                 # Return ModelNotFoundException If not found
Model::where('legs', '>', 3)->firstOrFail();                         # Return ModelNotFoundException If not found
```

- Inserting data

```
# Retrieve flight by name or create it if it doesn't exist...

$flight = Flight::firstOrCreate([
    'name' => 'London to Paris'
]);

# Retrieve flight by name or create it with attribute of both arrays.

$flight = Flight::firstOrCreate(
    ['name' => 'London to Paris'],
    ['delayed' => 1, 'arrival_time' => '11:30']
);


# Only create, fillable property must be defined to be able to assign a property.

$flight = Flight::create([
    'name' => 'London to Paris',
]);

# Also can be created like this

$flight = new Flight;
$flight->name = $request->name;
$flight->save();
```

- Updating data

```
$flight = Flight::find(1);
$flight->name = 'Paris to London';
$flight->save();


Flight::where('active', 1)
      ->where('destination', 'San Diego')
      ->update(['delayed' => 1]);


# Find by departure and destination, If not exists create with elements of both arrays.
$flight = Flight::updateOrCreate(
    ['departure' => 'Oakland', 'destination' => 'San Diego'],
    ['price' => 99, 'discounted' => 1]
);

```

- Deleting

```
$flight = Flight::find(1);
$flight->delete();

Flight::destroy(1);
$deletedRows = Flight::where('active', 0)->delete();
```

- Soft delete, including `deleted_at` instead of deleting row.

```
class Flight extends Model
{
    use SoftDeletes;
}
```

- Recover soft deleted

```
Flight::withTrashed()
        ->where('airline_id', 1)
        ->restore();
```

## Collections

Methods all and get retrieve multiple records, those records aren't an array, are a collection.
[Collections](https://laravel.com/docs/8.x/collections#available-methods).

```
$model->sortBy('price');
model->last();
model->has(['price'])
```

## ViewComposer

```
composer dump-autoload
```


# Query Builder

```
$users = DB::table('users')->get();
$user = DB::table('users')->where('name', 'John')->first();
$email = DB::table('users')->where('name', 'John')->value('email');
$users = DB::table('users')->select('name', 'email as user_email')->get();
toSql();
```

- Raws

```
$users = DB::table('users')
     ->select(DB::raw('count(*) as user_count, status'))
     ->where('status', '<>', 1)
     ->groupBy('status')
     ->get();
```

```
selectRaw
whereRaw
```

## Joins

```
$users = DB::table('users')
            ->join('contacts', 'users.id', '=', 'contacts.user_id')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->select('users.*', 'contacts.phone', 'orders.price')
            ->get();
```

```
leftJoin
join
crossJoin
```

