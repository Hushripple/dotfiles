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
