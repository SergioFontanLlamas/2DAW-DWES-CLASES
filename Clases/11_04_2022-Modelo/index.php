<?php
    /**
     * El API de Twig me obliga a colocar estas lineas para utilizar el motor de plantillas
     */ 

     /**
      * require_once -> igual que require pero comprueba antes si ya esta incluido para no incluirlo otra vez
      * require -> si no encuentra, da excepcion
      * include -> si no encuentra, aparece warning y continua ejecucion
      */

    // Carga el fichero autoload.php
    require_once 'vendor/autoload.php';

    // Ubicacion de mis plantillas de Twig
    $loader = new \Twig\Loader\FilesystemLoader('templates');
    $twig = new \Twig\Environment($loader);
    /**
     * $GLOBALS almacena variables para estar accesibles en todo mi documento
     */
    $GLOBALS["twig"];
    // Ejecuta con "render" la vista que yo quiero
    // echo $twig->render('users/create.twig');

    require_once 'models/User.php';
    $user = new User();
    $user->setId(2);
    
    // print_r ($user->findAll());

    echo $twig->render(
        'users/index.twig', 
        [
            'users' => $user->findAll(),
        ]
    );
?>