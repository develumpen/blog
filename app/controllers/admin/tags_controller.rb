class Admin::TagsController < AdminController
  before_action :set_tag, only: %i[ edit update destroy ]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to admin_tags_path, notice: "Etiqueta añadida con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, notice: "Etiqueta editada con éxito", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy!
    redirect_to admin_tags_path, notice: "Etiqueta eliminada con éxito", status: :see_other
  end

  private
    def set_tag
      @tag = Tag.find(params.expect(:id))
    end

    def tag_params
      params.expect(tag: [ :name ])
    end
end
