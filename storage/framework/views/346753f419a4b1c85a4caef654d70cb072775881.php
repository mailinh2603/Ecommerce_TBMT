
<!-- Start Shop Newsletter  -->
<section class="shop-newsletter section">
    <div class="container">
        <div class="inner-top">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <!-- Start Newsletter Inner -->
                    <div class="inner">
                        <h4>Bản tin</h4>
                        <p> Đăng ký nhận bản tin của chúng tôi và nhận <span>10%</span> giảm giá cho lần mua hàng đầu tiên</p>
                        <form action="<?php echo e(route('subscribe')); ?>" method="post" class="newsletter-inner">
                            <?php echo csrf_field(); ?>
                            <input name="email" placeholder="Địa chỉ email của bạn" required="" type="email">
                            <button class="btn" type="submit">Đăng ký</button>
                        </form>
                    </div>
                    <!-- End Newsletter Inner -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Shop Newsletter -->
<?php /**PATH C:\Users\hau06\Downloads\Ecommerce_TBMT2\Ecommerce_TBMT2\Ecommerce_TBMT\resources\views/frontend/layouts/newsletter.blade.php ENDPATH**/ ?>