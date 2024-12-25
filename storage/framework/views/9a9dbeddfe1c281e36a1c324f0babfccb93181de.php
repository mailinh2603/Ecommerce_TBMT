<?php $__env->startSection('main-content'); ?>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Thống Kê Tồn Kho</h6>
    </div>
    <div class="card-body">
        <!-- Form lọc -->
        <form action="<?php echo e(route('product.inventory')); ?>" method="get" class="form-inline mb-3">
    <label for="category_id" class="mr-2">Chọn Loại Sản Phẩm:</label>
    <select name="category_id" id="category_id" class="form-control mr-3">
        <option value="">Tất cả</option>
        <?php $__currentLoopData = App\Models\Category::all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($category->id); ?>" <?php echo e((isset($categoryId) && $category->id == $categoryId) ? 'selected' : ''); ?>>
                <?php echo e($category->title); ?>

            </option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </select>
    <button type="submit" class="btn btn-primary">
        <i class="fas fa-search"></i> Lọc
    </button>

    <!-- Nút Xuất Excel -->
    <a href="<?php echo e(route('product.inventory.export', ['category_id' => request('category_id')])); ?>"
       class="btn btn-success ml-2">
        <i class="fas fa-file-excel"></i> Xuất Excel
    </a>
</form>


        <!-- Bảng hiển thị -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>#</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Loại Sản Phẩm</th>
                        <th>Tồn Kho</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                        <td><?php echo e($index + 1); ?></td>
                        <td><?php echo e($product->title); ?></td>
                        <td><?php echo e($product->cat_info->title ?? 'Không rõ'); ?></td>
                        <td><?php echo e($product->stock); ?></td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\hau06\Downloads\Ecommerce_TBMT2\Ecommerce_TBMT2\Ecommerce_TBMT\resources\views/backend/report/inventory.blade.php ENDPATH**/ ?>