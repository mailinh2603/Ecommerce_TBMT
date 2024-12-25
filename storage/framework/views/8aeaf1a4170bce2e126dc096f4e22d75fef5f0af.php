<?php $__env->startSection('meta'); ?>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name='copyright' content=''>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="keywords" content="online shop, purchase, cart, ecommerce site, best online shopping">
	<meta name="description" content="<?php echo e($product_detail->summary); ?>">
	<meta property="og:url" content="<?php echo e(route('product-detail',$product_detail->slug)); ?>">
	<meta property="og:type" content="article">
	<meta property="og:title" content="<?php echo e($product_detail->title); ?>">
	<meta property="og:image" content="<?php echo e($product_detail->photo); ?>">
	<meta property="og:description" content="<?php echo e($product_detail->description); ?>">
<?php $__env->stopSection(); ?>
<?php $__env->startSection('title','Ecommerce Laravel || PRODUCT DETAIL'); ?>
<?php $__env->startSection('main-content'); ?>

		<!-- Breadcrumbs -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="bread-inner">
							<ul class="bread-list">
								<li><a href="<?php echo e(route('home')); ?>">Trang chủ<i class="ti-arrow-right"></i></a></li>
								<li class="active"><a href="">Chi tiết sản phẩm</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->

		<!-- Shop Single -->
		<section class="shop single section">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="row">
									<div class="col-lg-6 col-12">
										<!-- Product Slider -->
										<div class="product-gallery">
											<!-- Images slider -->
											<div class="flexslider-thumbnails">
												<ul class="slides">
													<?php
														$photo=explode(',',$product_detail->photo);
													// dd($photo);
													?>
													<?php $__currentLoopData = $photo; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
														<li data-thumb="<?php echo e($data); ?>" rel="adjustX:10, adjustY:">
															<img src="<?php echo e($data); ?>" alt="<?php echo e($data); ?>">
														</li>
													<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
												</ul>
											</div>
											<!-- End Images slider -->
										</div>
										<!-- End Product slider -->
									</div>
									<div class="col-lg-6 col-12">
										<div class="product-des">
											<!-- Description -->
											<div class="short">
												<h4><?php echo e($product_detail->title); ?></h4>
												<div class="rating-main">
													<ul class="rating">
														<?php
															$rate=ceil($product_detail->getReview->avg('rate'))
														?>
															<?php for($i=1; $i<=5; $i++): ?>
																<?php if($rate>=$i): ?>
																	<li><i class="fa fa-star"></i></li>
																<?php else: ?>
																	<li><i class="fa fa-star-o"></i></li>
																<?php endif; ?>
															<?php endfor; ?>
													</ul>
													<a href="#" class="total-review">(<?php echo e($product_detail['getReview']->count()); ?>) Review</a>
                                                </div>
                                                <?php
                                                    $after_discount=($product_detail->price-(($product_detail->price*$product_detail->discount)/100));
                                                ?>
												<p class="price">
    <span class="discount"><?php echo e(number_format($after_discount, 0, ',', '.')); ?>₫</span>
    <s><?php echo e(number_format($product_detail->price, 0, ',', '.')); ?>₫</s>
</p>

												<p class="description"><?php echo ($product_detail->summary); ?></p>
											</div>
											<!--/ End Description -->
											<!-- Color -->
											
											<!--/ End Color -->
											<!-- Size -->
											<?php if($product_detail->size): ?>
												<div class="size mt-4">
													<h4>Size</h4>
													<ul>
														<?php
															$sizes=explode(',',$product_detail->size);
															// dd($sizes);
														?>
														<?php $__currentLoopData = $sizes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $size): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
														<li><a href="#" class="one"><?php echo e($size); ?></a></li>
														<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
													</ul>
												</div>
											<?php endif; ?>
											<!--/ End Size -->
											<!-- Product Buy -->
											<div class="product-buy">
												<form action="<?php echo e(route('single-add-to-cart')); ?>" method="POST">
													<?php echo csrf_field(); ?>
													<div class="quantity">
														<h6>Số lượng :</h6>
														<!-- Input Order -->
														<div class="input-group">
															<div class="button minus">
																<button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
																	<i class="ti-minus"></i>
																</button>
															</div>
															<input type="hidden" name="slug" value="<?php echo e($product_detail->slug); ?>">
															<input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1" id="quantity">
															<div class="button plus">
																<button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
																	<i class="ti-plus"></i>
																</button>
															</div>
														</div>
													<!--/ End Input Order -->
													</div>
													<div class="add-to-cart mt-4">
														<button type="submit" class="btn"> Thêm vào giỏ hàng</button>
														<a href="<?php echo e(route('add-to-wishlist',$product_detail->slug)); ?>" class="btn min"><i class="ti-heart"></i></a>
													</div>
												</form>

												<p class="cat">Loại sản phẩm :<a href="<?php echo e(route('product-cat',$product_detail->cat_info['slug'])); ?>"><?php echo e($product_detail->cat_info['title']); ?></a></p>
												<?php if($product_detail->sub_cat_info): ?>
												<p class="cat mt-1">Loại sản phẩm  :<a href="<?php echo e(route('product-sub-cat',[$product_detail->cat_info['slug'],$product_detail->sub_cat_info['slug']])); ?>"><?php echo e($product_detail->sub_cat_info['title']); ?></a></p>
												<?php endif; ?>
												<!-- <p class="availability">Stock : <?php if($product_detail->stock>0): ?><span class="badge badge-success"><?php echo e($product_detail->stock); ?></span><?php else: ?> <span class="badge badge-danger"><?php echo e($product_detail->stock); ?></span>  <?php endif; ?></p> -->
												<p class="availability"> Còn Hàng:
    <?php if($product_detail->stock > 0): ?>
        <?php if($product_detail->stock < 5): ?>
            <span class="badge badge-warning">Sắp hết hàng</span>
        <?php else: ?>
            <span class="badge badge-success">Còn hàng</span>
        <?php endif; ?>
    <?php else: ?>
        <span class="badge badge-danger">Hết hàng</span>
    <?php endif; ?>
</p>

											</div>
											<!--/ End Product Buy -->
											<!-- Visit 'codeastro' for more projects -->
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<div class="product-info">
											<div class="nav-main">
												<!-- Tab Nav -->
												<ul class="nav nav-tabs" id="myTab" role="tablist">
													<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#description" role="tab">Chi tiết sản phẩm</a></li>
													<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Đánh giá</a></li>
												</ul>
												<!--/ End Tab Nav -->
											</div>
											<div class="tab-content" id="myTabContent">
												<!-- Description Tab -->
												<div class="tab-pane fade show active" id="description" role="tabpanel">
													<div class="tab-single">
														<div class="row">
															<div class="col-12">
																<div class="single-des">
																	<p><?php echo ($product_detail->description); ?></p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!--/ End Description Tab -->
												<!-- Reviews Tab -->
<div class="tab-pane fade" id="reviews" role="tabpanel">
    <div class="tab-single review-panel">
        <div class="row">
            <div class="col-12">

                <!-- Review -->
                <div class="comment-review">
                    <div class="add-review">
                        <h5>Thêm đánh giá</h5>
                        <p>Địa chỉ email của bạn sẽ không được công bố. Các trường bắt buộc được đánh dấu</p>
                    </div>
                    <h4>Đánh giá của bạn<span class="text-danger">*</span></h4>
                    <button id="writeReviewBtn" class="btn" style="margin-top: 9px;">Viết đánh giá</button>
                    <div class="review-inner" id="reviewForm" style="display: none;">
                        <!-- Form -->
                        <?php if(auth()->guard()->check()): ?>
                        <form class="form" method="post" action="<?php echo e(route('review.store', $product_detail->slug)); ?>">
                            <?php echo csrf_field(); ?>
                            <div class="row">
                                <div class="col-lg-12 col-12">
                                    <div class="rating_box">
                                        <div class="star-rating">
                                            <div class="star-rating__wrap">
                                                <input class="star-rating__input" id="star-rating-5" type="radio" name="rate" value="5">
                                                <label class="star-rating__ico fa fa-star-o" for="star-rating-5" title="5 out of 5 stars"></label>
                                                <input class="star-rating__input" id="star-rating-4" type="radio" name="rate" value="4">
                                                <label class="star-rating__ico fa fa-star-o" for="star-rating-4" title="4 out of 5 stars"></label>
                                                <input class="star-rating__input" id="star-rating-3" type="radio" name="rate" value="3">
                                                <label class="star-rating__ico fa fa-star-o" for="star-rating-3" title="3 out of 5 stars"></label>
                                                <input class="star-rating__input" id="star-rating-2" type="radio" name="rate" value="2">
                                                <label class="star-rating__ico fa fa-star-o" for="star-rating-2" title="2 out of 5 stars"></label>
                                                <input class="star-rating__input" id="star-rating-1" type="radio" name="rate" value="1">
                                                <label class="star-rating__ico fa fa-star-o" for="star-rating-1" title="1 out of 5 stars"></label>
                                                <?php $__errorArgs = ['rate'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <span class="text-danger"><?php echo e($message); ?></span>
                                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-12">
                                    <div class="form-group">
                                        <label>Viết bài đánh giá</label>
                                        <textarea name="review" rows="6" placeholder=""></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-12">
                                    <div class="form-group button5">
                                        <button type="submit" class="btn">Nộp</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <?php else: ?>
                        <p class="text-center p-5">
                            Bạn cần phải <a href="<?php echo e(route('login.form')); ?>" style="color:rgb(54, 54, 204)">Đăng nhập</a> hoặc <a style="color:blue" href="<?php echo e(route('register.form')); ?>">Đăng ký</a>
                        </p>
                        <?php endif; ?>
                    </div>
                </div>

                <div class="ratting-main">
                    <div class="avg-ratting">
                        <h4><?php echo e(ceil($product_detail->getReview->avg('rate'))); ?> <span>(Overall)</span></h4>
                        <span>Dựa trên <?php echo e($product_detail->getReview->count()); ?> Bình luận</span>
                    </div>
                    <?php $__currentLoopData = $product_detail['getReview']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <!-- Single Rating -->
                    <div class="single-rating">
                        <div class="rating-author">
                            <?php if($data->user_info['photo']): ?>
                            <img src="<?php echo e($data->user_info['photo']); ?>" alt="<?php echo e($data->user_info['photo']); ?>">
                            <?php else: ?>
                            <img src="<?php echo e(asset('backend/img/avatar.png')); ?>" alt="Profile.jpg">
                            <?php endif; ?>
                        </div>
                        <div class="rating-des">
                            <h6><?php echo e($data->user_info['name']); ?></h6>
                            <div class="ratings">
                                <ul class="rating">
                                    <?php for($i = 1; $i <= 5; $i++): ?>
                                        <?php if($data->rate >= $i): ?>
                                            <li><i class="fa fa-star"></i></li>
                                        <?php else: ?>
                                            <li><i class="fa fa-star-o"></i></li>
                                        <?php endif; ?>
                                    <?php endfor; ?>
                                </ul>
                                <div class="rate-count">(<span><?php echo e($data->rate); ?></span>)</div>
                            </div>
                            <p><?php echo e($data->review); ?></p>
</div>
<div class="rating-des">

    <div class="ratings">


	<div class="response-section ms-3" style="margin-left: 20px;">
    <p><strong>Phản hồi:</strong></p>

    <?php $__empty_1 = true; $__currentLoopData = $data->responses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $response): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
	<p><strong>Người phản hồi:</strong> <?php echo e($response->user->name ?? 'N/A'); ?></p><br>
        <div class="response mb-3 p-2 border rounded shadow-sm" style="max-width: 60%;margin-left: 20px; background-color: #f8f9fa; box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 4px 5px 0 rgba(0, 0, 0, 0.19);">

            <p><?php echo e($response->content ?? 'No content available'); ?></p>
        </div><br>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
        <p>Chưa có phản hồi.</p>
    <?php endif; ?>
</div>


    <!-- Form phản hồi cho người dùng -->
    <?php if(auth()->guard()->check()): ?>
    <form action="<?php echo e(route('response.store', $data->id)); ?>" method="POST">
    <?php echo csrf_field(); ?>
    <div class="form-group ms-3 mt-3" style="margin-left: 20px;"	>
        <label for="content" class="form-label">Nhập phản hồi:</label>
        <input type="text" name="content" id="content" class="form-control border border-2 rounded-4 shadow-sm p-2 mb-3"
               placeholder="Nhập phản hồi..."
               style="background-color: #f8f9fa; border-color: #ddd; margin-left: 20px; transition: all 0.3s ease;box-shadow: 5px 5px 5px lightblue;">
    </div>
    <button type="submit" class="btn btn-primary ms-3 mt-3 shadow-lg"
            style="border-radius: 5px; transition: all 0.3s ease; padding: 10px 20px;">
        Gửi phản hồi
    </button>
</form>



    <?php else: ?>
    <p>Bạn cần phải <a href="<?php echo e(route('login.form')); ?>">đăng nhập</a> để phản hồi.</p>
    <?php endif; ?>
</div>


                        </div>
                    </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>

            </div>
        </div>
    </div>
</div>
<!--/ End Reviews Tab -->

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
		</section>
		<!--/ End Shop Single -->
		<!-- Visit 'codeastro' for more projects -->
		<!-- Start Most Popular -->
	<div class="product-area most-popular related-product section">
        <div class="container">
            <div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>Sản phẩm liên quan</h2>
					</div>
				</div>
            </div>
            <div class="row">
                
                <div class="col-12">
                    <div class="owl-carousel popular-slider">
                        <?php $__currentLoopData = $product_detail->rel_prods; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php if($data->id !==$product_detail->id): ?>
                                <!-- Start Single Product -->
                                <div class="single-product">
                                    <div class="product-img">
										<a href="<?php echo e(route('product-detail',$data->slug)); ?>">
											<?php
												$photo=explode(',',$data->photo);
											?>
                                            <img class="default-img" src="<?php echo e($photo[0]); ?>" alt="<?php echo e($photo[0]); ?>">
                                            <img class="hover-img" src="<?php echo e($photo[0]); ?>" alt="<?php echo e($photo[0]); ?>">
                                            <span class="price-dec"><?php echo e($data->discount); ?> % Off</span>
                                                                    
                                        </a>
                                        <div class="button-head">
                                            <div class="product-action">
                                                <a data-toggle="modal" data-target="#modelExample" title="Quick View" href="#"><i class=" ti-eye"></i><span>Mua sắm nhanh</span></a>
                                            </div>
                                            <div class="product-action-2">
                                                <a title="Add to cart" href="#">Thêm vào giỏ hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <h3><a href="<?php echo e(route('product-detail',$data->slug)); ?>"><?php echo e($data->title); ?></a></h3>
                                        <div class="product-price">
                                            <?php
                                                $after_discount=($data->price-(($data->discount*$data->price)/100));
                                            ?>
                                           <span class="old"><?php echo e(number_format($data->price, 0, ',', '.')); ?>₫</span>
<span><?php echo e(number_format($after_discount, 0, ',', '.')); ?>₫</span>

                                        </div>

                                    </div>
                                </div>
                                <!-- End Single Product -->

                            <?php endif; ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                </div>
            </div>
        </div>
    </div>
    </div>
	<!-- End Most Popular Area -->


  <!-- Modal -->
  <div class="modal fade" id="modelExample" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
            </div>
            <div class="modal-body">
                <div class="row no-gutters">
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                        <!-- Product Slider -->
                            <div class="product-gallery">
                                <div class="quickview-slider-active">
                                    <div class="single-slider">
                                        <img src="images/modal1.png" alt="#">
                                    </div>
                                    <div class="single-slider">
                                        <img src="images/modal2.png" alt="#">
                                    </div>
                                    <div class="single-slider">
                                        <img src="images/modal3.png" alt="#">
                                    </div>
                                    <div class="single-slider">
                                        <img src="images/modal4.png" alt="#">
                                    </div>
                                </div>
                            </div>
                        <!-- End Product slider -->
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                        <div class="quickview-content">
                            <h2>Flared Shift Dress</h2>
                            <div class="quickview-ratting-review">
                                <div class="quickview-ratting-wrap">
                                    <div class="quickview-ratting">
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="yellow fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <a href="#"> (1 customer review)</a>
                                </div>
                                <div class="quickview-stock">
                                    <span><i class="fa fa-check-circle-o"></i> in stock</span>
                                </div>
                            </div>
                            <h3>$29.00</h3>
                            <div class="quickview-peragraph">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam.</p>
                            </div>
                            <div class="size">
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <h5 class="title">Size</h5>
                                        <select>
                                            <option selected="selected">s</option>
                                            <option>m</option>
                                            <option>l</option>
                                            <option>xl</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <h5 class="title">Color</h5>
                                        <select>
                                            <option selected="selected">orange</option>
                                            <option>purple</option>
                                            <option>black</option>
                                            <option>pink</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="quantity">
                                <!-- Input Order -->
                                <div class="input-group">
                                    <div class="button minus">
                                        <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                            <i class="ti-minus"></i>
                                        </button>
									</div>
                                    <input type="text" name="qty" class="input-number"  data-min="1" data-max="1000" value="1">
                                    <div class="button plus">
                                        <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                            <i class="ti-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <!--/ End Input Order -->
                            </div>
                            <div class="add-to-cart">
                                <a href="#" class="btn">Add to cart</a>
                                <a href="#" class="btn min"><i class="ti-heart"></i></a>
                                <a href="#" class="btn min"><i class="fa fa-compress"></i></a>
                            </div>
                            <div class="default-social">
                                <h4 class="share-now">Share:</h4>
                                <ul>
                                    <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                    <li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->

<?php $__env->stopSection(); ?>
<?php $__env->startPush('styles'); ?>
	<style>
		/* Rating */
		.rating_box {
		display: inline-flex;
		}

		.star-rating {
		font-size: 0;
		padding-left: 10px;
		padding-right: 10px;
		}

		.star-rating__wrap {
		display: inline-block;
		font-size: 1rem;
		}

		.star-rating__wrap:after {
		content: "";
		display: table;
		clear: both;
		}

		.star-rating__ico {
		float: right;
		padding-left: 2px;
		cursor: pointer;
		color: #F7941D;
		font-size: 16px;
		margin-top: 5px;
		}

		.star-rating__ico:last-child {
		padding-left: 0;
		}

		.star-rating__input {
		display: none;
		}

		.star-rating__ico:hover:before,
		.star-rating__ico:hover ~ .star-rating__ico:before,
		.star-rating__input:checked ~ .star-rating__ico:before {
		content: "\F005";
		}

	</style>
<?php $__env->stopPush(); ?>
<?php $__env->startPush('scripts'); ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    document.getElementById('writeReviewBtn').addEventListener('click', function() {
        const reviewForm = document.getElementById('reviewForm');
        if (reviewForm.style.display === 'none') {
            reviewForm.style.display = 'block';
        } else {
            reviewForm.style.display = 'none';
        }
    });
</script>

    

<?php $__env->stopPush(); ?>

<?php echo $__env->make('frontend.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\hau06\Downloads\Ecommerce_TBMT2\Ecommerce_TBMT2\Ecommerce_TBMT\resources\views/frontend/pages/product_detail.blade.php ENDPATH**/ ?>