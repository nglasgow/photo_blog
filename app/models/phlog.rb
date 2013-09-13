class Phlog < ActiveRecord::Base
  attr_accessible :name, :image
  mount_uploader :image, ImageUploader

  after_save :enqueue_image

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      phlog = Phlog.find(id)
      phlog.key = key
      phlog.remote_image_url = phlog.image.direct_fog_url(with_path: true)
      phlog.save!
      phlog.update_column(:image_processed, true)
    end
  end
end
