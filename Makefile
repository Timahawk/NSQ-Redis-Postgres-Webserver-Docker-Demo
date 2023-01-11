.PHONY: build run remove

imagename=simpleservergo
imageversion=v1

# @ removes the line where it prints the command
default:	
	@echo "You can run 'build', 'run' and 'clean'" 

# Creating the image:
build:
	cd nsqconsumer; go build -o nsqconsumer .
	cd backend; go build -o backend .

# Starting a container which will be deleted after exit:
# run:
# 	# docker run --rm -p 8080:8080 ${imagename}:${imageversion}
# 	docker compose --rm up
 
# docker image rm ${imagename}:${imageversion}



clean:
	docker compose down
	cd nsqconsumer; rm nsqconsumer
	cd backend; rm backend


superclean: clean
	docker rmi codingchallengehans-gobackend:latest
	docker rmi codingchallengehans-nsqconsumer_links:latest
	docker rmi codingchallengehans-nsqconsumer_rechts:latest

	docker volume rm codingchallengehans_cache
	docker volume rm codingchallengehans_db




