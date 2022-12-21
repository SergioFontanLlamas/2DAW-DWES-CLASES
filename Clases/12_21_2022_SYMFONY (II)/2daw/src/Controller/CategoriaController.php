<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Categorias;
use Doctrine\Migrations\Configuration\EntityManager\ManagerRegistryEntityManager;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\HttpFoundation\Session\Session;
use Doctrine\Persistence\ManagerRegistry;

class CategoriaController extends AbstractController
{
    /**
     * @Route("/categoria", name="app_categoria")
     */
    public function index(){
        /**
         * Paso 1. Utilizo Doctrine() para utilizar la clase Categoria
         */
        $categoria =  $this->getDoctrine()->getRepository(Categorias::class);

        /**
         * Paso 2. Necesito que recoja todos los valores de categoria
         * query que se realiza es              ---> SELECT * FROM cateogorias;
         * metodo que necesito utilizar         ---> findAll();
         */

         $cat = $categoria->findAll();

        return $this->render('categoria/index.html.twig', [
            'controller_name' => 'CategoriaController',
            'categorias' => $cat
        ]);
    }

    /**
     * Funcion que me lleva a la vista de crear categoria
     */
    public function create(){
        /**
         * Paso 1. Genero un objeto de Categoria
         */
        $categoria = new Categorias();

        /**
         * Paso 2. Generl el formulario con sintaxis de Symfony
         * 
         * createFormBuilder()   --> generar un formulario para rellenar un objeto
         * setAction()           --> generar la accion del formulario. 
         *                           En este caso introducimos la ruta donde vamos a llevar los datos.
         * setMethod()           --> establece el tipo de formulario
         * add()                 --> genera un input para el formulario
         *                           TextType::class genera un input de tipo text
         *                           SubmitType::class  genera un boton de tipo submit
         * getForm()             --> finaliza el formulario
         * 
         * createView()          --> genera la vista del formulario creado
         */

        $formulario = $this->createFormBuilder($categoria)
                           ->setAction($this->generateUrl('categoria_save'))
                           ->setMethod('POST')
                           ->add('nombre', TextType::class)
                           ->add('tipo', TextType::class)
                           ->add('submit', SubmitType::class)
                           ->getForm();

        return $this->render('categoria/create.html.twig', [
            'controller_name' => 'CategoriaController',
            'formulario' =>$formulario->createView()
        ]);
    }

    /**
     * Funcion que guarda una categoria nueva
     */
    public function save(Request $request){
        /**
         * Paso 1. Recoger los datos del formulario
         */
        $categoria_form = $request->get('form');
        
        /**
         * Paso 2. EntityManager
         */
        $em = $this->getDoctrine()->getManager();

        /**
         * Paso 3. Crear objeto Categorias y guardar los elementos recogidos
         */
        $categoria = new Categorias();
        $categoria->setNombre($categoria_form['nombre']);
        $categoria->setTipo($categoria_form['tipo']);

        /**
         * Paso 4. Guardo la categoria en el em con la funcion persist
         */
        $em->persist($categoria);

        /**
         * Paso 5. Realizo el volcado de datos a la BD
         */
        $em->flush();

        /**
         * Paso 6. Genero un mensaje para la insercion
         */
         $session = new Session();

         $session->getFlashBag()->add(
            'message', 
            'Categoria creada correctamente'
        );

        $session->getFlashBag()->add(
            'message',
            'Esto dura solo una vez'
        );

        return $this->redirectToRoute('categoria_index');
    }

    public function edit(Categorias $categoria, ManagerRegistry $doctrine){
        $em = $doctrine->getRepository(Categorias::class);

        // look for a single Product by its primary key (usually "id")
        $c = $em->find($categoria->getId());
        // var_dump($c);
        // exit();

        $formulario = $this->createFormBuilder($c)
            ->setAction($this->generateUrl('categoria_update'))
            ->setMethod('POST')
            ->add('id', HiddenType::class)
            ->add('nombre', TextType::class)
            ->add('tipo', TextType::class)
            ->add('submit', SubmitType::class)
            ->getForm();

        return $this->render('categoria/edit.html.twig', [
            'controller_name' => 'CategoriaController',
            'formulario' =>$formulario->createView()
        ]);
    }

    public function update(Request $request, ManagerRegistry $doctrine){
        $categoria_form = $request->get('form');

        $entityManager = $doctrine->getManager();
        $categoria_actualizada = $entityManager->getRepository(Categorias::class)->find($categoria_form['id']);

        $categoria_actualizada->setNombre($categoria_form['nombre']);
        $categoria_actualizada->setTipo($categoria_form['tipo']);
        
        $entityManager->flush();

        $session = new Session();

        $session->getFlashBag()->add(
           'message', 
           'Categoria eliminada correctamente'
       );
        return $this->redirectToRoute('categoria_index');
    }

    public function destroy(Categorias $categoria){
        $em = $this->getDoctrine()->getManager();
        $em->remove($categoria);
        $em->flush();

        $session = new Session();
        $session->getFlashBag()->add(
           'message', 
           'Categoria eliminada correctamente'
       );
        return $this->redirectToRoute('categoria_index');

    }
    /**
     * Funcion que muestra una categoria filtrada por $id
     */
    public function show($id){
        var_dump($id);
        exit();
    }
}
