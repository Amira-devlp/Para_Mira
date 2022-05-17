<?php

@include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>about</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'header.php'; ?>

<section class="about">

   <div class="row">

      <div class="box">
         <img src="images/choix.png" alt="Pourquoi nous choisir ?">
         <h3> Pourquoi nous choisir ? </h3>
</br>
         <h1>Notre parapharmacie vous fournit une fiablité au niveau de ses produits qui sont garantis par nos marques partenaires , ainsi 
            qu'une efficacité et une qualité de haut niveau et notament un service rapide et disponible ! 
</h1>
</br>

         <a href="contact.php" class="btn">Contactez-Nous</a>
      </div>

      <div class="box">
         <img src="images/produits.jpg" alt=" Découvrez Nos produits ! ">
         <h3>Découvrez Nos produits !</h3>
         <h1> Notre parapharmacie Para Mira vous fournit des soins pour votre corps , cheveux et Visage sans oublier d'avoir pensé aux bébés et mamans et tous leurs besoins 
            aux meilleurs prix imbattables Alors n'hésitez pas à faire un petit tour et achetez ce qui vous manque afin de rendre votre vie plus harmonieuse ! 
         </h1>
</br>
         <a href="shop.php" class="btn">Go Shopping</a>
      </div>

   </div>

</section>

<section class="reviews">

   <h1 class="title">Avis Des clients Satisfaits </h1>

   <div class="box-container">

      <div class="box">
         <img src="images/yasmine.png" alt=" C'est Yasmine">
         <p>Salut tout le monde , Personnellement j'ai testé pratiquement tous les produits de chez Para Mira , je valide la haute qualité , la fiabilité 
            et je l'ai déja recommandé à mes amies et mes cousines donc pour ceux qui l'ont pas essayé prenez une pause , brisez volontairement votre rythme et consacrez du temps pour vivre la vie en Rose et profiter du bon moment ! 
         </p>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
         </div>
         <h3>Yasmine Ben Fraj  </h3>
      </div>

      <div class="box">
         <img src="images/amira.png" alt=" C'est Amira ">
         <p>Salut , C'est Amira , I highly recommand cette parapharmacie parce qu'elle a tout simplement changé ma vie , elle m'a beaucoup aidé ,en effet 
            j'ai récement accouché et tout ce que j'avais besoin je l'ai trouvé sur ce site sans meme me déplacer ! Gardez Cette excellente qualité de service 
         et bonne continuation !  </p>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
         </div>
         <h3>Amira Chebbi</h3>
      </div>

      <div class="box">
         <img src="images/alia.png" alt="C'est Alia ">
         <p>Bonjour , Au début j'ai commencé il y a un mois presque à utiliser les produits de Para Mira au niveau de mon visage , ca m'a donné un coup 
            d'éclat énorme que toute le monde m'a fait la remarque , Merci Bien je le recommande vivement ! 
         </p>
         <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            
         </div>
         <h3>Alia Ben Rjab </h3>
      </div>


   </div>

</section>









<?php include 'footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>