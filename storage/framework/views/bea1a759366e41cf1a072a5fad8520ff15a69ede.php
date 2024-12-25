<?php $__env->startSection('main-content'); ?>

<div class="card">
    <h5 class="card-header">Thêm Sản Phẩm</h5>
    <div class="card-body">
      <form method="post" action="<?php echo e(route('product.store')); ?>">
        <?php echo e(csrf_field()); ?>

        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Tiêu Đề <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="title" placeholder="Nhập tiêu đề"  value="<?php echo e(old('title')); ?>" class="form-control">
          <?php $__errorArgs = ['title'];
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

        <div class="form-group">
          <label for="summary" class="col-form-label">Tóm Tắt <span class="text-danger">*</span></label>
          <textarea class="form-control" id="summary" name="summary"><?php echo e(old('summary')); ?></textarea>
          <?php $__errorArgs = ['summary'];
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

        <div class="form-group">
          <label for="description" class="col-form-label">Mô Tả</label>
          <textarea class="form-control" id="description" name="description"><?php echo e(old('description')); ?></textarea>
          <?php $__errorArgs = ['description'];
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

        <div class="form-group">
          <label for="is_featured">Nổi Bật</label><br>
          <input type="checkbox" name='is_featured' id='is_featured' value='1' checked> Có
        </div>

        <div class="form-group">
          <label for="cat_id">Danh Mục <span class="text-danger">*</span></label>
          <select name="cat_id" id="cat_id" class="form-control">
              <option value="">--Chọn danh mục--</option>
              <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$cat_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                  <option value='<?php echo e($cat_data->id); ?>'><?php echo e($cat_data->title); ?></option>
              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
          </select>
        </div>

        <div class="form-group d-none" id="child_cat_div">
          <label for="child_cat_id">Danh Mục Con</label>
          <select name="child_cat_id" id="child_cat_id" class="form-control">
              <option value="">--Chọn danh mục con--</option>
          </select>
        </div>

        <div class="form-group">
          <label for="price" class="col-form-label">Giá($) <span class="text-danger">*</span></label>
          <input id="price" type="number" name="price" placeholder="Nhập giá"  value="<?php echo e(old('price')); ?>" class="form-control">
          <?php $__errorArgs = ['price'];
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

        <div class="form-group">
          <label for="discount" class="col-form-label">Giảm Giá(%)</label>
          <input id="discount" type="number" name="discount" min="0" max="100" placeholder="Nhập giảm giá"  value="<?php echo e(old('discount')); ?>" class="form-control">
          <?php $__errorArgs = ['discount'];
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

        <div class="form-group">
          <label for="size">Kích Cỡ</label>
          <select name="size[]" class="form-control selectpicker"  multiple data-live-search="true">
              <option value="">--Chọn kích cỡ--</option>
              <option value="8GB - 256GB">8GB - 256GB</option>
              <option value="8GB - 512GB">8GB - 512GB</option>
              <option value="16GB - 256GB">16GB - 256GB</option>
              <option value="16GB - 512GB">16GB - 512GB</option>
              <option value="16GB - 1TB">16GB - 1TB</option>
              <option value="32GB - 512GB">32GB - 512GB</option>
          </select>
        </div>

        <div class="form-group">
          <label for="brand_id">Thương Hiệu</label>
          <select name="brand_id" class="form-control">
              <option value="">--Chọn thương hiệu--</option>
             <?php $__currentLoopData = $brands; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $brand): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
              <option value="<?php echo e($brand->id); ?>"><?php echo e($brand->title); ?></option>
             <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
          </select>
        </div>

        <div class="form-group">
          <label for="condition">Tình Trạng</label>
          <select name="condition" class="form-control">
              <option value="">--Chọn tình trạng--</option>
              <option value="default">Mặc Định</option>
              <option value="new">Mới</option>
              <option value="hot">Nóng</option>
          </select>
        </div>

        <div class="form-group">
          <label for="stock">Số Lượng <span class="text-danger">*</span></label>
          <input id="quantity" type="number" name="stock" min="0" placeholder="Nhập số lượng"  value="<?php echo e(old('stock')); ?>" class="form-control">
          <?php $__errorArgs = ['stock'];
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

        <div class="form-group">
          <label for="inputPhoto" class="col-form-label">Hình Ảnh <span class="text-danger">*</span></label>
          <div class="input-group">
              <span class="input-group-btn">
                  <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-secondary text-white">
                  <i class="fa fa-picture-o"></i> Chọn
                  </a>
              </span>
          <input id="thumbnail" class="form-control" type="text" name="photo" value="<?php echo e(old('photo')); ?>">
        </div>
        <div id="holder" style="margin-top:15px;max-height:100px;"></div>
          <?php $__errorArgs = ['photo'];
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

        <div class="form-group">
          <label for="status" class="col-form-label">Trạng Thái <span class="text-danger">*</span></label>
          <select name="status" class="form-control">
              <option value="active">Kích Hoạt</option>
              <option value="inactive">Vô Hiệu</option>
          </select>
          <?php $__errorArgs = ['status'];
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
        <div class="form-group mb-3">
          <button type="reset" class="btn btn-warning">Làm Mới</button>
           <button class="btn btn-success" type="submit">Gửi</button>
        </div>
      </form>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('styles'); ?>
<link rel="stylesheet" href="<?php echo e(asset('backend/summernote/summernote.min.css')); ?>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
<?php $__env->stopPush(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="<?php echo e(asset('backend/summernote/summernote.min.js')); ?>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

<script>
    $('#lfm').filemanager('image');

    $(document).ready(function() {
      $('#summary').summernote({
        placeholder: "Nhập mô tả ngắn...",
          tabsize: 2,
          height: 100
      });
    });

    $(document).ready(function() {
      $('#description').summernote({
        placeholder: "Nhập mô tả chi tiết...",
          tabsize: 2,
          height: 150
      });
    });

</script>

<script>
  $('#cat_id').change(function(){
    var cat_id=$(this).val();
    if(cat_id !=null){
      // Gọi Ajax
      $.ajax({
        url:"/admin/category/"+cat_id+"/child",
        data:{
          _token:"<?php echo e(csrf_token()); ?>",
          id:cat_id
        },
        type:"POST",
        success:function(response){
          if(typeof(response) !='object'){
            response=$.parseJSON(response)
          }
          var html_option="<option value=''>----Chọn danh mục con----</option>"
          if(response.status){
            var data=response.data;
            if(response.data){
              $('#child_cat_div').removeClass('d-none');
              $.each(data,function(id,title){
                html_option +="<option value='"+id+"'>"+title+"</option>"
              });
            }
          }
          else{
            $('#child_cat_div').addClass('d-none');
          }
          $('#child_cat_id').html(html_option);
        }
      });
    }
  })
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('backend.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\hau06\Downloads\Ecommerce_TBMT2\Ecommerce_TBMT2\Ecommerce_TBMT\resources\views/backend/product/create.blade.php ENDPATH**/ ?>