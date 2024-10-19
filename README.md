# .xinitrc
![xinitrc](https://cdn.discordapp.com/attachments/1287597164436000898/1297214782549659658/xinitrc-example.png?ex=67151ce9&is=6713cb69&hm=cbb4910aedd2942a7e0ba66aa229ab0866e38cfe2443d9af986fcbe09a3e0d44&)

Lo más relevante de este .xinitrc son las líneas para establecer el wallpaper y el colorscheme, y lo que se debe ejecutar:

```
xwallpaper --zoom 'Imágenes/wallpaper3.png'
wal -i 'Imágenes/wallpaper3.png'
```

Se necesita ``` sudo pacman -S xwallpaper ``` y ``` sudo pacman -S python-pywal ``` para que funcione.

**xwallpaper** sirve para establecer una imágen como wallpaper y cuenta con algunas configuraciones. **python-pywal/wal -i** es para establecer el colorscheme en base a una imágen.

Si el colorscheme no se está guardando correctamente luego de hacer ``` source .xinitrc ```, es probable que sea problema del caché de pywal. En ese caso hacer ``` rm -rf .cache/wal ``` para eliminar la caché. 

Finalmente apretar **MODKEY + F5** para que se aplique correctamente el colorscheme.

Hay formas de automatizar esto, pero soy muy flojo para hacerlo y mi configuración funciona sin problemas.

Los programas que se ejecutan en el .xinitrc son los siguientes:

```
dwmblocks &
xcompmgr &
exec dwm
```

Se necesita ``` sudo pacman -S xcompmgr ``` para darle el efecto de transparencia a la terminal (st con ohmyzsh)

Ya que utilizo dwm, al final de todo el archivo se debe hacer ```exec dwm```


# dwmblocks y bin

![dwmblocks](https://cdn.discordapp.com/attachments/1287597164436000898/1297222399082631288/dwmblocks-example-2.png?ex=67152401&is=6713d281&hm=3286c514c822f1f3b797981f7e3d2bbcea2f1677ec64ac23e4967c389f7d98f9&)

El propósito de .local/bin es guardar ahí los scripts que se quieran utilizar en dwmblocks, los cuales saco de ![este repositorio de Luke Smith](https://github.com/LukeSmithxyz/voidrice/tree/master/.local/bin/statusbar)

El proceso para todo esto es buscar en su repositorio lo que queramos utilizar en nuestro dwmblocks, acceder al raw y:

```
cd .local/bin
wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/refs/heads/master/.local/bin/statusbar/sb-battery
mv sb-battery battery
chmod +x battery
```

``` mv sb-battery battery ``` cambia el nombre del archivo a simplemente "battery" para que sea más sencillo de utilizar, aunque no es necesario.

``` chmod +x battery ``` convierte el archivo en un script ejecutable, lo cual es necesario para poder utilizarlo.

Luego de hacer esto, podemos editar el script a nuestra preferencia

```
vim battery
```

![dwmblocks2](https://cdn.discordapp.com/attachments/1287597164436000898/1297206008673861743/bin-example.png?ex=671514bd&is=6713c33d&hm=44688874291f62e4b9d0221dd2ab22d2bb69a2eb3f7d2db0031e503f2b3d07fb&)

Se puede testear y verificar que los scripts estén mostrándose y funcionando correctamente antes de incluirlos en el config.h simplemente escribiendo el nombre del script en la terminal:

![bin](https://cdn.discordapp.com/attachments/1287597164436000898/1297208970066526270/bin-example-2.png?ex=6715177f&is=6713c5ff&hm=077e21277cbdd06228b90a7570d00bdbc2254482f87a5314fa6b429560fa95da&)

