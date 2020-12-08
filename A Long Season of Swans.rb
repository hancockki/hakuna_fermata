# Welcome to Sonic Pi

#get song directory
song = "/Users/kimhancock/Desktop/Computational_Creativity/music_files/"

#song intro function
define :intro do
  with_fx :reverb do
    sample song, "green_arrow", start: 0, finish: 0.15, amp: 0.4, release: 5
    sleep 15
    sample song, "a_piece_of_the_sky", start: 0, finish: 0.025, attack: 10, release: 20
    sleep 30
  end
end

#section 1 for song
define :section1 do
  with_fx :echo do
    sample song, "storm", start: 0.01, finish: 0.08, release: 20, amp: 1.5
  end
  sample song, "green_arrow", amp: 0.3, start: 0.15, finish: 0.25, attack: 20, release: 25
  sleep 35
  # I took these chords from the chord progression of "Storm"
  2.times do
    use_synth :dark_ambience
    play chord(:Bb, :minor7),  amp: 0.5
    sleep 1
    play chord(:Bb, :minor7), attack: 0.5, release: 1, amp: 0.4
    sleep 2
    play chord(:Eb, :minor7), amp: 0.5
    sleep 1
    play chord(:Db, :major7), attack: 1, release: 1, amp: 0.4
    sleep 2
    play chord(:F, :minor7), amp: 0.5
    sleep 1
    play chord(:F, :minor7), attack: 1, release: 1, amp: 0.5
    sleep 1
  end
  use_synth :dark_ambience
  play_chord [:c4, :e4, :g4, :b4], attack: 1, sustain: 2, release: 1, amp: 0.2
  sleep 5
  play_chord [:c4, :e4, :g4, :a4], attack: 0.5, sustain: 1, release: 0.5, amp: 0.15
  sleep 5
  play_chord [:c4, :d4, :e4, :g4], attack: 1, sustain: 2, release: 1, amp: 0.1
  sleep 5
  
  use_synth :piano
  play 60, attack: 2, sustain: 4, release: 2, amp: 0.3
  sleep 5
  play 24, attack: 2, sustain: 4, release: 2, amp: 0.3
  sleep 5
  play chord(:a3, :minor), attack: 2, sustain: 4, release: 2, amp: 0.3
  sleep 5
  play 29, attack: 2, sustain: 4, release: 2, amp: 0.2
  sleep 5
  with_fx :reverb do
    sample song, "a_piece_of_the_sky", start: 0.09, finish: 0.11, attack: 20, release: 20, amp: 0.4
  end
  sleep 5
end

define :section2 do
  with_fx :echo do
    sample song, "long_season1", amp: 2, start: 0.18, finish: 0.33, attack: 20, release: 20
    sleep 5
  end
  # added some fun hums and ambient piano!
  sample :ambi_glass_hum,amp: 0.5
  sleep (range 0.3, 1,0.1).choose
  use_synth :beep
  play_pattern_timed [:a3,:e3,:d3,:e3], [8,8,8,8],
    attack: 0.5, sustain: 1, release: 0.5, amp: 0.3
  sample :ambi_piano, amp: 0.5
  sleep (range 0.5,1,0.1).choose
  sample song, "storm", start: 0.388, finish: 0.4, attack: 20, release: 20
  sleep 25
end

#section 3 of the song, where it starts to build
define :section3 do
  with_fx :echo do
    sample song, "sigur_ros", start: 0.1, finish: 0.19, attack: 20
  end
  sleep 20
  with_fx :echo do
    sample song, "a_piece_of_the_sky", start: 0.745, finish: 0.785, attack: 20, release: 30
  end
  2.times do
    use_synth :piano
    play chord(:Bb, :minor7),  amp: 0.6
    sleep 1
    play chord(:Bb, :minor7), attack: 0.5, release: 1, amp: 0.8
    sleep 2
    play chord(:Eb, :minor7), amp: 0.6
    sleep 1
    play chord(:Db, :major7), attack: 1, release: 1, amp: 1
    sleep 2
    play chord(:F, :minor7), amp: 0.6
    sleep 1
    play chord(:F, :minor7), attack: 1, release: 1, amp: 1.2
    sleep 1
  end
  sleep 20
end

#outro of the song
define :outro do
  # layer the ending of storm
  with_fx :echo do
    sample song, "storm", start: 0.975, finish: 1, attack: 20, release: 20, amp: 1.5
  end
  sleep 5
  with_fx :reverb do
    sample song, "storm", start: 0.98, finish: 1, attack: 20, release: 20, amp: 1.5
  end
  # end with the bird sounds of this song
  sample song, "green_arrow", start: 0.85, finish: 1, attack: 15, release: 20
  use_synth :noise
  play chord(:Bb, :minor7),  amp: 0.2
  sleep 1
  play chord(:Bb, :minor7), attack: 0.5, release: 1, amp: 1.4
  sleep 2
  play chord(:Eb, :minor7), amp: 0.175
  sleep 1
  play chord(:Db, :major7), attack: 1, release: 1, amp: 1.4
  sleep 2
  play chord(:F, :minor7), amp: 0.15
  sleep 1
  play chord(:F, :minor7), attack: 1, release: 1, amp: 0.1
  sleep 1
  # keep layering
  sample song, "storm", start: 0.97, finish: 1, attack: 20, release: 20, amp: 1.5
  sleep 15
  #end with the wonky parts of this
  with_fx :distortion do
    sample song, "sigur_ros", start: 0.85, finish: 1, attack: 30, release: 20
  end
end

#driver for the whole thing
define :playsong do
  intro
  section1
  section2
  section3
  outro
end

playsong