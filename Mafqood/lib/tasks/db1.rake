namespace :db1 do
	desc"updating index"
	task import_indicies: :environment do
		Finding_post.import
		Suspect_post.import
		Missing_post.import
	end
end