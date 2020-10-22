
# Activitys

Las actividades tienen que estar definidas en el manifest

## cambiar de actividad

```
 val intent = Intent(this, SettingsActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, message)
            }
            startActivity(intent)
```

## Permisos

Si una actividad necessita permisos para poder ser ejecutada, hay que marcarlo en manifest
```
<manifest>
    <activity android:name="...."
       android:permission=”com.google.socialapp.permission.SHARE_POST”

    />
```
La aplicacion que quiera usar esa actividad, tiene que marcar permisos en su aplicacion
```
<manifest>
   <uses-permission android:name="com.google.socialapp.permission.SHARE_POST" />
</manifest>
```

## Ciclos de vida

### onCreate()

Cuando se crea la actividad, se debe inicializar los componentes bases de la actividad.

### onResume()

Justo antes que la actividad empieze a interactuar.

Es donde se implementa la mayoria de funcionabilidad.

### onPause()

Cuando la actividad pierde el focus y ya no es visible o parcialmente visible.

En este punto se debe guardar el estado. Despues de pause, se vuelve a onResume.

# Fragments

Estan ligados a una actividad, son parte de la vista.

## Creacion

### A partir del xml

```
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="horizontal"
    android:layout_width="match_parent"
    android:layout_height="match_parent">
    <fragment android:name="com.example.news.ArticleListFragment"
            android:id="@+id/list"
            android:layout_weight="1"
            android:layout_width="0dp"
            android:layout_height="match_parent" />
    <fragment android:name="com.example.news.ArticleReaderFragment"
            android:id="@+id/viewer"
            android:layout_weight="2"
            android:layout_width="0dp"
            android:layout_height="match_parent" />
</LinearLayout>
```

# Interficie de usuario

## App bar

Se debe usar una activity AppCompatActivity.

En theme del manifest tiene que estar usando un noActionBar
```xml
<style name="AppTheme" parent="Theme.AppCompat.Light.NoActionBar">
```

En el activity.xml incluirla

```xml
 <androidx.appcompat.widget.Toolbar
        android:id="@+id/toolbar"
        android:layout_width="match_parent"
        android:layout_height="?attr/actionBarSize"
        app:titleTextColor="@android:color/white"
        android:elevation="4dp"
        android:theme="@style/ThemeOverlay.AppCompat.ActionBar"
        app:popupTheme="@style/ThemeOverlay.AppCompat.Light"
        android:background="?attr/colorPrimary">
    </androidx.appcompat.widget.Toolbar>
```

Definirla como la toolbar en la activity

```
override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
    }
```

### Incluir botones de accion

Crear un menu en res/menu/menu.xml con los items

```xml
<menu xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">
    <!-- Settings, should always be in the overflow -->
    <item android:id="@+id/action_settings"
        android:title="Settings"
        android:icon="@drawable/ic_icons_settings"
        app:showAsAction="ifRoom|withText"/>
</menu>
```

En la activity, crear el menu

```
override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu, menu);
        return true;
    }
```

Reaccionar a click del boton de menu

```
override fun onOptionsItemSelected(item: MenuItem): Boolean = when (item.itemId) {
        R.id.action_settings -> {
            // User chose the "Settings" item, show the app settings UI...
            println("settings pressed")
            true
        }

        else -> {
            // If we got here, the user's action was not recognized.
            // Invoke the superclass to handle it.
            super.onOptionsItemSelected(item)
        }
    }
```

### Boton de volver a actividad anterior en menu

Incluir el parent activity en el manifest

```xml
<activity
            android:name=".SettingsActivity"
            android:label="Settings"
            android:parentActivityName="com.nedo.app.MainActivity">
```

Habilitar el boton de back del menu en la activity

```
supportActionBar?.setDisplayHomeAsUpEnabled(true)
```

＃ Guardar datos

## SharedPreferences

Para guardar pocos datos en formato clave valor


Reference:
https://developer.android.com/guide/components/fragments
