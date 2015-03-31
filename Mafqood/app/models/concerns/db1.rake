namespace :db1 do
	desc"updating index"
	task import_indicies: :environment do
		Finding_post.import
		task import_indicies: :environment do
		Suspect_post.import
		task import_indicies: :environment do
		Missing_post.import
	end
end