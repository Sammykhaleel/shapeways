task :seed => [:environment] do
DataGatherer.new.run
end