//
//  EpisodeView.swift
//  Netflix
//
//  Created by Lourdes on 1/19/21.
//

import SwiftUI

struct EpisodeView: View {
    let viewModel = EpisodeViewModel()
    
    @Binding var isSeasonPickerVisible: Bool
    @Binding var selectedSeason: Int
        
    init(seasonPickerBilder: Binding<Bool>, episodes: [EpisodeInfo], selectedSeasonNumber: Binding<Int>) {
        _isSeasonPickerVisible = seasonPickerBilder
        viewModel.episodes = episodes
        _selectedSeason = selectedSeasonNumber
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    isSeasonPickerVisible = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                })
                Spacer()
            }
            
            //Episode List
            ForEach(viewModel.getEpisodes(forSeason: selectedSeason)) { episode in
                VStack(alignment: .leading) {
                    HStack {
                        VideoPreviewContainer(imageUrl: episode.imageUrl ?? "", videoUrl: episode.videoUrl ?? "")
                            .frame(width: 120, height: 70)
                            .clipped()
                        VStack(alignment: .leading) {
                            Text(episode.episodeName ?? "")
                                .font(.system(size: 16))
                            Text("\(episode.length ?? 0)")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "arrow.down.to.line.alt")
                            .font(.system(size: 20))
                    }
                    .frame(width: UIScreen.width)
                    Text(episode.description ?? "")
                        .font(.system(size: 13))
                        .lineLimit(4)
                }
                .padding(.bottom, 20)
            }
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodeView(seasonPickerBilder: .constant(false), episodes: exampleEpisodes, selectedSeasonNumber: .constant(1 ))
        }
    }
}
