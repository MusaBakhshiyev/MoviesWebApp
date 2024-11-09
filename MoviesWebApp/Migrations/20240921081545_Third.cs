using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MoviesWebApp.Migrations
{
    public partial class Third : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CommentLikeDislike_Comment_CommentId",
                table: "CommentLikeDislike");

            migrationBuilder.AddForeignKey(
                name: "FK_CommentLikeDislike_Comment_CommentId",
                table: "CommentLikeDislike",
                column: "CommentId",
                principalTable: "Comment",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CommentLikeDislike_Comment_CommentId",
                table: "CommentLikeDislike");

            migrationBuilder.AddForeignKey(
                name: "FK_CommentLikeDislike_Comment_CommentId",
                table: "CommentLikeDislike",
                column: "CommentId",
                principalTable: "Comment",
                principalColumn: "Id");
        }
    }
}
