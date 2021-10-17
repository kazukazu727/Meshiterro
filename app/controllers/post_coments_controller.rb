class PostComentsController < ApplicationController

  def create
    post_image=PostImage.find(params[:post_image_id])
    coment=current_user.post_coments.new(post_coment_params)
    coment.post_image_id = post_image.id
    coment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    PostComent.find_by(id:params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private
  def post_coment_params
    params.require(:post_coment).permit(:coment)
  end

end
