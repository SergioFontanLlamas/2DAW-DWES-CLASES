<?php
    /**
     * El API de Twig me obliga a colocar estas lineas para utilizar el motor de plantillas
     */ 

    // Carga el fichero autoload.php
    require_once 'vendor/autoload.php';

    // Ubicacion de mis plantillas de Twig
    $loader = new \Twig\Loader\FilesystemLoader('templates');
    $twig = new \Twig\Environment($loader);

    // Ejecuta con "render" la vista que yo quiero
    // echo $twig->render('users/create.twig');

    echo $twig->render(
        'users/index.twig', 
        [
            'mensaje' => 'MENSAJE',
            'alumno' => 'DANIEL',
            'numero' => 8,
            'dias' => ['lunes', 'martes', 'miercoles', 'jueves', 'viernes']
        ]
    );

?>