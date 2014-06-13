# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

emotions = [
  {
    name: "Emotion Wheel",
    source: "https://en.wikipedia.org/wiki/Emotion#mediaviewer/File:Emotions.gif",
    emotions: ["Happy","Excited","Tender","Sad","Angry","Scared"]
  },
  {
    name: "Plutchik",
    source: "http://changingminds.org/explanations/emotions/basic%20emotions.htm",
    emotions: ["Acceptance","anger","anticipation","disgust","joy","fear","sadness","surprise"]
  },
  {
    name: "Arnold",
    source: "http://changingminds.org/explanations/emotions/basic%20emotions.htm",
    emotions: ["Anger","aversion","courage","dejection","desire","despair","fear","hate","hope","love","sadness"]
  },
  {
    name: "Ekman, Friesen, and Ellsworth",
    source: "http://changingminds.org/explanations/emotions/basic%20emotions.htm",
    emotions: ["Anger","disgust","fear","joy","sadness","surprise"]
  },
  {
    name: "Frijda",
    source: "http://changingminds.org/explanations/emotions/basic%20emotions.htm",
    emotions: ["Desire","happiness","interest","surprise","wonder","sorrow"]
  },
  {
    name: "Weiner and Graham",
    source: "http://changingminds.org/explanations/emotions/basic%20emotions.htm",
    emotions: ["Happiness","sadness"]
  },
  {
    name: "Izard",
    source: "http://changingminds.org/explanations/emotions/basic%20emotions.htm",
    emotions: ["Anger","contempt","disgust","distress","fear","guilt","interest","joy","shame","surprise"]
  },
]

emotions.each do |group|
  g = EmotionGroup.where(name: group[:name]).first_or_create
  g.source = group[:source]

  group[:emotions].each do |name|
    g.emotions.where(name: name).first_or_create
  end

  g.save
end

User.where(emotion_group_id: nil).update_all emotion_group_id: EmotionGroup.first.id

