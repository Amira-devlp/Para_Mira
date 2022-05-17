<?php

@include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
};

if(isset($_POST['add_to_wishlist'])){

   $pid = $_POST['pid'];
   $pid = filter_var($pid, FILTER_SANITIZE_STRING);
   $p_name = $_POST['p_name'];
   $p_name = filter_var($p_name, FILTER_SANITIZE_STRING);
   $p_price = $_POST['p_price'];
   $p_price = filter_var($p_price, FILTER_SANITIZE_STRING);
   $p_image = $_POST['p_image'];
   $p_image = filter_var($p_image, FILTER_SANITIZE_STRING);

   $check_wishlist_numbers = $conn->prepare("SELECT * FROM `wishlist` WHERE name = ? AND user_id = ?");
   $check_wishlist_numbers->execute([$p_name, $user_id]);

   $check_cart_numbers = $conn->prepare("SELECT * FROM `cart` WHERE name = ? AND user_id = ?");
   $check_cart_numbers->execute([$p_name, $user_id]);

   if($check_wishlist_numbers->rowCount() > 0){
      $message[] = 'Déja existant aux favoris !';
   }elseif($check_cart_numbers->rowCount() > 0){
      $message[] = 'Déja existant au panier !';
   }else{
      $insert_wishlist = $conn->prepare("INSERT INTO `wishlist`(user_id, pid, name, price, image) VALUES(?,?,?,?,?)");
      $insert_wishlist->execute([$user_id, $pid, $p_name, $p_price, $p_image]);
      $message[] = 'Ajouté aux favoris!';
   }

}

if(isset($_POST['add_to_cart'])){

   $pid = $_POST['pid'];
   $pid = filter_var($pid, FILTER_SANITIZE_STRING);
   $p_name = $_POST['p_name'];
   $p_name = filter_var($p_name, FILTER_SANITIZE_STRING);
   $p_price = $_POST['p_price'];
   $p_price = filter_var($p_price, FILTER_SANITIZE_STRING);
   $p_image = $_POST['p_image'];
   $p_image = filter_var($p_image, FILTER_SANITIZE_STRING);
   $p_qty = $_POST['p_qty'];
   $p_qty = filter_var($p_qty, FILTER_SANITIZE_STRING);

   $check_cart_numbers = $conn->prepare("SELECT * FROM `cart` WHERE name = ? AND user_id = ?");
   $check_cart_numbers->execute([$p_name, $user_id]);

   if($check_cart_numbers->rowCount() > 0){
      $message[] = 'Déja existant au panier';
   }else{

      $check_wishlist_numbers = $conn->prepare("SELECT * FROM `wishlist` WHERE name = ? AND user_id = ?");
      $check_wishlist_numbers->execute([$p_name, $user_id]);

      if($check_wishlist_numbers->rowCount() > 0){
         $delete_wishlist = $conn->prepare("DELETE FROM `wishlist` WHERE name = ? AND user_id = ?");
         $delete_wishlist->execute([$p_name, $user_id]);
      }

      $insert_cart = $conn->prepare("INSERT INTO `cart`(user_id, pid, name, price, quantity, image) VALUES(?,?,?,?,?,?)");
      $insert_cart->execute([$user_id, $pid, $p_name, $p_price, $p_qty, $p_image]);
      $message[] = 'Ajouté avec succès au panier';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home page</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'header.php'; ?>

<div class="home-bg">
   <section class="home">
   
      <div class="content">
      
         <span>L'unique personne qui t'accompagne toute ta vie , C'est toi même , Prends soin de toi !  </span>
         <h3>Etes-Vous à la recherche du secret pour rester jeune ? </h3>
         <p> Votre corps a besoin de repos , l'esprit a besoin de paix et le coeur a besoin de joie ,Alors ne ratez pas la chance de 
             découvrir tous les produits de parapharmacie 
             soins du visage, bébé enfants et maternité, soins du corps et cheveux et entamez un mode de vie plus sain ! 
         </p>
         <a href="about.php" class="btn">A propos de nous</a>
      </div>

   </section>

</div>

<section class="home-category">

   <h1 class="title">Faites votre choix </h1>

   <div class="box-container">

      <div class="box">
         <img src="images/visage.jfif" alt="">
         <h3>Visage</h3>
         <p>Des gestes et des soins beauté qui apportent beauté, éclat 
            et santé à votre visage. Prendre soin de sa peau au quotidien est nécessaire avec les agressions quotidiennes. </p>
         <a href="category.php?category=Visage" class="btn">Visage</a>
      </div>

      <div class="box">
         <img src="images/corps.jfif" alt="">
         <h3>Corps</h3>
         <p>Découvrez nos produits de soins corporels , 
            qui sont  créés pour être facilement absorbés, 
            afin que vous puissiez profiter du plaisir de vous sentir bien dans votre peau</p>
         <a href="category.php?category=Corps" class="btn">Corps</a>
      </div>

      <div class="box">
         <img src="images/bebe.jfif" alt="">
         <h3>Bébé & Maman</h3>
         <p>Notre sélection regroupe tous les produits nécessaires pour le Bien-être du Bébé et Maman. 
            Surfez en ligne et retrouvez tout ce qui vous manque : biberon, sucette, tétine, thermomètre et tous les autres accessoires</p>
         <a href="category.php?category=Bebe" class="btn">Bébé & Maman</a>
      </div>

      <div class="box">
         <img src="images/cheveux.jfif" alt="">
         <h3>Cheveux</h3>
         <p>Découvrer les meilleurs soins pour cheuveux sur notre site. Nous proposons un large choix de Shampooings, 
            Après Shampooings, masques et produits coiffants, Soins Anti-chute, Soins capillaires</p>
         <a href="category.php?category=Cheveux" class="btn">Cheveux</a>
      </div>

   </div>

</section>

<section class="products">

   <h1 class="title">Derniers Produits</h1>

   <div class="box-container">

   <?php
      $select_products = $conn->prepare("SELECT * FROM `products` LIMIT 6");
      $select_products->execute();
      if($select_products->rowCount() > 0){
         while($fetch_products = $select_products->fetch(PDO::FETCH_ASSOC)){ 
   ?>
   <form action="" class="box" method="POST">
      <div class="price">$<span><?= $fetch_products['price']; ?></span>/-</div>
      <a href="view_page.php?pid=<?= $fetch_products['id']; ?>" class="fas fa-eye"></a>
      <img src="images/<?= $fetch_products['image']; ?>" alt="">
      <div class="name"><?= $fetch_products['name']; ?></div>
      <input type="hidden" name="pid" value="<?= $fetch_products['id']; ?>">
      <input type="hidden" name="p_name" value="<?= $fetch_products['name']; ?>">
      <input type="hidden" name="p_price" value="<?= $fetch_products['price']; ?>">
      <input type="hidden" name="p_image" value="<?= $fetch_products['image']; ?>">
      <input type="number" min="1" value="1" name="p_qty" class="qty">
      <input type="submit" value="add to wishlist" class="option-btn" name="add_to_wishlist">
      <input type="submit" value="add to cart" class="btn" name="add_to_cart">
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">Aucun produit ajouté !</p>';
   }
   ?>

   </div>

</section>







<?php include 'footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>