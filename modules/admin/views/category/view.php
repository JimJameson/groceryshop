<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Category */

$this->title = "Категория: {$model->title}";
$this->params['breadcrumbs'][] = ['label' => 'Категории', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>

<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <?= Html::a('Изменить', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
                <?= Html::a('Удалить', ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => 'Вы действительно хотите удалить эту категорию?',
                        'method' => 'post',
                    ],
                ]) ?>
            </div>
            <div class="box-body">
                <div class="category-view">
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => [
                            'id',
//                            'parent_id',
                            [
                                'attribute' => 'parent_id',
                                'value' => isset($model->parent->title) ?
                                    Html::a($model->parent->title,['category/view', 'id'=>$model->parent_id]) :
                                    'нет',
                                'format' => 'html',
                            ],
                            'title',
                            'description',
                            'keywords',
                        ],
                    ]) ?>
                </div>
            </div>
        </div>
    </div>
</div>


