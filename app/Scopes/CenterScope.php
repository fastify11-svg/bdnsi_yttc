<?php

namespace App\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;
use Illuminate\Support\Facades\Schema;

class CenterScope implements Scope
{
    /**
     * Apply the scope to a given Eloquent query builder.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $builder
     * @param  \Illuminate\Database\Eloquent\Model  $model
     * @return void
     */
    public function apply(Builder $builder, Model $model)
    {
        if (auth()->guard('web')->check() && auth()->guard('web')->user()->center_id) {
            $centerId = auth()->guard('web')->user()->center_id;

            if (Schema::hasColumn($model->getTable(), 'center_id')) {
                $builder->where($model->getTable() . '.center_id', $centerId);
            } elseif (Schema::hasColumn($model->getTable(), 'student_id')) {
                $builder->whereHas('student', function ($query) use ($centerId) {
                    $query->where('center_id', $centerId);
                });
            }
        }
    }
}

